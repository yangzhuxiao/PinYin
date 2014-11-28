//
//  ListenItemViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/25/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ListenItemViewController.h"
#import "Constants.h"
#import "ItemCollectionViewCell.h"

@interface ListenItemViewController () < UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate >
{
    NSUInteger timeCount;
    BOOL isAutoPlaying;
    BOOL isDragging;
    NSTimer *timer;
}
@property (nonatomic, copy) NSArray *wordsArray;
@end

@implementation ListenItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // must not be omitted, otherwise the color of subview "collectionView" will crash
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *dataArray = [NSMutableArray array];
    NSString *plistPath = @"/Users/yangxiaozhu/Desktop/test.plist";
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    for (id item in data) {
        [dataArray addObject:item];
    }
    
    _wordsArray = [data allKeys];
    
    // The order of the following three must not be changed !
    [self setUpCollectionViewAndPageControl];
    [self setUpBackButton];
    [self setUpAutoPlayButton];
    [self setUpIndexLabel];
    
    // repare audioPlayer and play once
    [self setUpAudioPlayer];
    
    // auto scrolling initializer
    timeCount = 0;
    isAutoPlaying = NO;
    isDragging = NO;
}

- (void)setUpAudioPlayer
{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
    
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"mp3"];
    NSURL *audioUrl = [NSURL fileURLWithPath:audioPath];
    NSError *playerError;
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:&playerError];
    if (_audioPlayer == NULL)
    {
        return;
    }
    [_audioPlayer setNumberOfLoops:0];
    [_audioPlayer setVolume:1];
    [_audioPlayer prepareToPlay];
    [_audioPlayer play];
}

- (void)setUpCollectionViewAndPageControl
{
    //Item collection
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    _itemCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0, 0.0, ItemColletionViewWidth, ItemColletionViewHeight) collectionViewLayout:layout];
    layout.itemSize = _itemCollectionView.bounds.size;
    _itemCollectionView.delegate = self;
    _itemCollectionView.dataSource = self;
    _itemCollectionView.backgroundColor = [UIColor whiteColor];
    _itemCollectionView.pagingEnabled = YES;
    _itemCollectionView.showsHorizontalScrollIndicator = NO;
    [_itemCollectionView registerClass:[ItemCollectionViewCell class] forCellWithReuseIdentifier:@"ItemCell"];

    [self.view addSubview:_itemCollectionView];
}

- (void)setUpBackButton
{
    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(BackButtonXOriginPercent *WIDTH, BackButtonYOriginPercent *HEIGHT, BackButtonWidthPercent *WIDTH, BackButtonHeightPercent *HEIGHT)];
    [_backButton setTitle:@"<<Back" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _backButton.titleLabel.font = [UIFont boldSystemFontOfSize:self.view.frame.size.width * BackButtonFontPercentWidth];
    _backButton.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1].CGColor;
    _backButton.layer.borderWidth = 1.0f;
    _backButton.layer.cornerRadius = 5.0f;
    [_backButton addTarget:self action:@selector(backToRoot:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_backButton];
}

- (void)setUpAutoPlayButton
{
    _autoPlayButton = [[UIButton alloc] initWithFrame:CGRectMake((1 - autoPlayButtonXOffsetToRightPercent - autoPlayButtonWidthPercent) *WIDTH, autoPlayButtonYOriginPercent *HEIGHT, autoPlayButtonWidthPercent *WIDTH, autoPlayButtonHeightPercent *HEIGHT)];
    [_autoPlayButton setTitle:@"AutoPlay" forState:UIControlStateNormal];
    [_autoPlayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _autoPlayButton.titleLabel.font = [UIFont boldSystemFontOfSize:self.view.frame.size.width * autoPlayButtonFontPercentWidth];
    _autoPlayButton.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1].CGColor;
    _autoPlayButton.layer.borderWidth = 1.0f;
    _autoPlayButton.layer.cornerRadius = 5.0f;
    [_autoPlayButton addTarget:self action:@selector(beginAutoPlay:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_autoPlayButton];
}


- (void)setUpIndexLabel
{
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(IndexLabelXOriginPercent *WIDTH, IndexLabelYOriginPercent *HEIGHT, IndexLabelWidthPercent *WIDTH, IndexLabelHeightPercent *HEIGHT)];
    _indexLabel.font = [UIFont systemFontOfSize:self.view.frame.size.width * IndexLabelFontPercentWidth];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
    _indexLabel.textColor = [UIColor blackColor];
    
    // must initialize, otherwise won't be able to see it at first!
    _indexLabel.text = [NSString stringWithFormat:@"1/%lu", (unsigned long)_wordsArray.count];

    [self.view addSubview:_indexLabel];
}

- (void)playMP3File:(id)sender {
    if (isAutoPlaying == YES) {
        [timer invalidate];
        isAutoPlaying = NO;
    }
    if (_audioPlayer.isPlaying == YES) {
        [_audioPlayer stop];
        //very important, otherwise start from where stopped last time
        _audioPlayer.currentTime = 0;
        [_audioPlayer play];
        return;
    }
    [_audioPlayer play];
}

- (void)backToRoot:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)beginAutoPlay:(id)sender {
    if (isAutoPlaying == YES) {
        [timer invalidate];
        isAutoPlaying = NO;
        return;
    }
    isDragging = NO;
    timer = [NSTimer scheduledTimerWithTimeInterval:ScrollingTimeInterval target:self selector:@selector(autoScrollPage:) userInfo:nil repeats:YES];
}

- (void)autoScrollPage:(id)sender {
    if (isDragging == YES || timeCount == _wordsArray.count) {
        isAutoPlaying = NO;
        [timer invalidate];
        return;
    }
    isAutoPlaying = YES;
    timeCount ++;
    [_itemCollectionView scrollRectToVisible:CGRectMake(ItemColletionViewWidth * timeCount, 0, ItemColletionViewWidth, ItemColletionViewHeight) animated:YES];
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _wordsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath: indexPath];
    cell.wordLabel.text = _wordsArray[indexPath.row];
    cell.tag = indexPath.row;
    
    // register for touch event
    [cell.playButton addTarget:self action:@selector(playMP3File:) forControlEvents:UIControlEventTouchUpInside];
    
    // only calulate here while isAutoPlaying, otherwise calculate in 'scrollViewDidEndDecelerating:'
    if (isAutoPlaying == YES) {
        _indexLabel.text = [NSString stringWithFormat:@"%ld/%lu", (long)indexPath.row + 1, (unsigned long)_wordsArray.count];
    }
    [_audioPlayer stop];
    _audioPlayer.currentTime = 0;
    [_audioPlayer play];
    return cell;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    isDragging = YES;
    [_audioPlayer stop];
    _audioPlayer.currentTime = 0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/self.view.frame.size.width;
//    _pageControl.currentPage = index;
    
    timeCount = index;
    // figure out the page down the view, must be "index+1", otherwise will start from 0
    _indexLabel.text = [NSString stringWithFormat:@"%d/%lu", index+1, (unsigned long)_wordsArray.count];
}

@end


