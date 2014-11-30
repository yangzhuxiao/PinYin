//
//  ListenItemViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/25/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ListenItemViewController.h"
#import "Constants.h"
#import "PhraseManager.h"
#import "Phrase.h"
#import "ItemCollectionViewCell.h"
#import <FontAwesomeKit/FAKIonIcons.h>

@interface ListenItemViewController () < UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate >
{
    NSUInteger timeCount;
    BOOL isAutoPlaying;
    BOOL isDragging;
    NSTimer *timer;
}
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) Phrase *currentPhrase;

@end

@implementation ListenItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    self.tabBarItem setImage:[FAKIcon ]
    
    // must not be omitted, otherwise the color of subview "collectionView" will crash
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = [[PhraseManager sharedManager] phrasesArrayForTag:_tag];
    
    // The order of the following three must not be changed !
    [self setUpCollectionView];
    [self setUpBackButton];
    [self setUpAutoPlayButton];
    [self setUpIndexLabel];
    
    // auto scrolling initializer
    timeCount = 0;
    isAutoPlaying = NO;
    isDragging = NO;
}

- (void)setUpCollectionView
{
    //Item collection
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    _itemCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0, 0.0, ItemColletionViewWidth, ItemColletionViewHeight) collectionViewLayout:layout];
    layout.itemSize = _itemCollectionView.bounds.size;
    _itemCollectionView.delegate = self;
    _itemCollectionView.dataSource = self;
    _itemCollectionView.pagingEnabled = YES;
    _itemCollectionView.showsHorizontalScrollIndicator = NO;
    [_itemCollectionView registerClass:[ItemCollectionViewCell class] forCellWithReuseIdentifier:@"ItemCell"];
    _itemCollectionView.backgroundColor = bgColor;

    [self.view addSubview:_itemCollectionView];
}

- (void)setUpBackButton
{
    _backButton = [UIButton buttonWithType:UIButtonTypeSystem];

    [_backButton setFrame:CGRectMake(BackButtonXOriginPercent *WIDTH, BackButtonYOriginPercent *HEIGHT, BackButtonWidthPercentWidth*WIDTH, BackButtonHeightPercentWidth*WIDTH)];
    
    FAKIonIcons *backIcon = [FAKIonIcons ios7CloseOutlineIconWithSize:BackButtonWidthPercentWidth*WIDTH];
    UIImage *backImage = [backIcon imageWithSize:CGSizeMake(BackButtonWidthPercentWidth*WIDTH, BackButtonWidthPercentWidth*WIDTH)];
    [_backButton setImage:backImage forState:UIControlStateNormal];
    _backButton.showsTouchWhenHighlighted = YES;
    
    [_backButton addTarget:self action:@selector(backToRoot:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_backButton];
}

- (void)setUpAutoPlayButton
{
    _autoPlayButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_autoPlayButton setFrame:CGRectMake((1 - autoPlayButtonXOffsetToRightPercent - autoPlayButtonWidthPercentWidth) *WIDTH, autoPlayButtonYOriginPercent *HEIGHT, autoPlayButtonWidthPercentWidth *WIDTH, autoPlayButtonHeightPercentWidth *WIDTH)];
    
    FAKIonIcons *backIcon = [FAKIonIcons videocameraIconWithSize:autoPlayButtonWidthPercentWidth*WIDTH];
    UIImage *backImage = [backIcon imageWithSize:CGSizeMake(autoPlayButtonWidthPercentWidth*WIDTH, autoPlayButtonWidthPercentWidth*WIDTH)];
    [_autoPlayButton setImage:backImage forState:UIControlStateNormal];
    _autoPlayButton.showsTouchWhenHighlighted = YES;
    
    [_autoPlayButton addTarget:self action:@selector(beginAutoPlay:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_autoPlayButton];
}

- (void)setUpIndexLabel
{
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(IndexLabelXOriginPercent *WIDTH, IndexLabelYOriginPercent *HEIGHT, IndexLabelWidthPercent *WIDTH, IndexLabelHeightPercent *HEIGHT)];
    _indexLabel.font = [UIFont systemFontOfSize:self.view.frame.size.width * IndexLabelFontPercentWidth];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.textColor = txtColor;
    
    // must initialize, otherwise won't be able to see it at first!
    _indexLabel.text = [NSString stringWithFormat:@"1/%lu", (unsigned long)_dataArray.count];
    
    [self.view addSubview:_indexLabel];
}

- (void)setUpAudioPlayerWithMp3FilePath:(NSString *)mp3Path
{
    if (_audioPlayer.playing == YES) {
        _audioPlayer = nil;
    }

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
    
    NSURL *audioUrl = [NSURL fileURLWithPath:mp3Path];
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
    if (isDragging == YES || timeCount == _dataArray.count) {
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
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath: indexPath];
    _currentPhrase = _dataArray[indexPath.row];
    
    // play once immediately
    [self setUpAudioPlayerWithMp3FilePath:_currentPhrase.mp3Path];

    cell.wordLabel.text = _currentPhrase.characters;
    cell.tag = indexPath.row;
    [cell.playButton addTarget:self action:@selector(playMP3File:) forControlEvents:UIControlEventTouchUpInside];
    
    // only calulate here while isAutoPlaying, otherwise calculate in 'scrollViewDidEndDecelerating:'
    if (isAutoPlaying == YES) {
        _indexLabel.text = [NSString stringWithFormat:@"%ld/%lu", (long)indexPath.row + 1, (unsigned long)_dataArray.count];
    }
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
    _audioPlayer = nil;
    _currentPhrase = _dataArray[index];
    [self setUpAudioPlayerWithMp3FilePath:_currentPhrase.mp3Path];
    
    timeCount = index;
    // figure out the page down the view, must be "index+1", otherwise will start from 0
    _indexLabel.text = [NSString stringWithFormat:@"%d/%lu", index+1, (unsigned long)_dataArray.count];
}

@end


