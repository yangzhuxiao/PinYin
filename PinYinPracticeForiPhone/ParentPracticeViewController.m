//
//  ParentPracticeViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ParentPracticeViewController.h"
#import "Constants.h"

static const NSString *lightToneString = @"light";
static const NSString *levelToneString = @"ˉ";
static const NSString *risingToneString = @"ˊ";
static const NSString *fallingRisingToneString = @"ˇ";
static const NSString *fallingToneString = @"ˋ";

@implementation ParentPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //correctNumber is initialized as 0
    _correctNumber = 0;
    
    // must not be omitted, otherwise the color of subview "collectionView" will crash
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *dataArray = [NSMutableArray array];
    NSString *plistPath = @"/Users/yangxiaozhu/Desktop/practice11.plist";
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    // pinyin without tones array
    for (id item in data) {
        [dataArray addObject:item];
    }
    _pinYinWithoutToneArray = [data allKeys];
    
    // all tones array
    dataArray = [NSMutableArray array];
    for (NSString *key in _pinYinWithoutToneArray) {
        NSString *firstTone;
        NSString *secondTone;
        id value = [data valueForKey:key];
        int firstToneNumber = [value intValue]/10;
        int secondToneNumber = [value intValue]%10;
        
        switch (firstToneNumber) {
            case 0:
                firstTone = (NSString *)lightToneString;
                break;
            case 1:
                firstTone = (NSString *)levelToneString;
                break;
            case 2:
                firstTone = (NSString *)risingToneString;
                break;
            case 3:
                firstTone = (NSString *)fallingRisingToneString;
                break;
            case 4:
                firstTone = (NSString *)fallingToneString;
                break;
            default:
                firstTone = @"";
                break;
        }
        
        switch (secondToneNumber) {
            case 0:
                secondTone = (NSString *)lightToneString;
                break;
            case 1:
                secondTone = (NSString *)levelToneString;
                break;
            case 2:
                secondTone = (NSString *)risingToneString;
                break;
            case 3:
                secondTone = (NSString *)fallingRisingToneString;
                break;
            case 4:
                secondTone = (NSString *)fallingToneString;
                break;
            default:
                secondTone = @"";
                break;
        }
        NSArray *unitArray = [NSArray array];
        unitArray = @[firstTone, secondTone];
        [dataArray addObject:unitArray];
    }
    _tonesArray = dataArray;
    
    // pinyin with tones array
    dataArray = [NSMutableArray array];
    plistPath = @"/Users/yangxiaozhu/Desktop/practice12.plist";
    data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    for (NSString *key in _pinYinWithoutToneArray) {
        id value = [data valueForKey:key];
        [dataArray addObject:value];
    }
    _pinYinWithToneArray = dataArray;
    
    
    // The order of the following three must not be changed !
    [self setUpCollectionViewAndPageControl];
    [self setUpBackButton];
    [self setUpIndexLabel];
    
    // repare audioPlayer and play once
    [self setUpAudioPlayer];
    [self setUpCountLabel];
}

- (void)setUpCountLabel
{
    _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(CountLabelXOriginPercent *WIDTH, CountLabelYOriginPercent *HEIGHT, CountLabelWidthPercent *WIDTH, CountLabelHeightPercent *HEIGHT)];
    _countLabel.font = [UIFont systemFontOfSize:self.view.frame.size.width * CountLabelFontPercentWidth];
    _countLabel.textAlignment = NSTextAlignmentRight;
    _countLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
    _countLabel.textColor = [UIColor blackColor];
    
    // must initialize, otherwise won't be able to see it at first!
    _countLabel.text = [NSString stringWithFormat:@"1/%lu", (unsigned long)_pinYinWithoutToneArray.count];
    
    [self updateCountLabel];
    
    [self.view addSubview:_countLabel];
}

- (void)updateCountLabel
{
    _countLabel.text = [NSString stringWithFormat:@"Correct/All: %ld/%lu", (long)_correctNumber, (unsigned long)_pinYinWithoutToneArray.count];
}

- (void)setUpCollectionViewAndPageControl
{
    //Item collection
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    _itemCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0, 0.0, ItemColletionViewWidth, ItemColletionViewHeight) collectionViewLayout:layout];
    layout.itemSize = _itemCollectionView.bounds.size;
    _itemCollectionView.backgroundColor = [UIColor whiteColor];
    _itemCollectionView.pagingEnabled = YES;
    _itemCollectionView.showsHorizontalScrollIndicator = NO;
    
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

- (void)setUpIndexLabel
{
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(IndexLabelXOriginPercent *WIDTH, IndexLabelYOriginPercent *HEIGHT, IndexLabelWidthPercent *WIDTH, IndexLabelHeightPercent *HEIGHT)];
    _indexLabel.font = [UIFont systemFontOfSize:self.view.frame.size.width * IndexLabelFontPercentWidth];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
    _indexLabel.textColor = [UIColor blackColor];
    
    // must initialize, otherwise won't be able to see it at first!
    _indexLabel.text = [NSString stringWithFormat:@"1/%lu", (unsigned long)_pinYinWithoutToneArray.count];
    
    [self.view addSubview:_indexLabel];
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

- (void)backToRoot:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_audioPlayer stop];
    _audioPlayer.currentTime = 0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/self.view.frame.size.width;
    
    // figure out the page down the view, must be "index+1", otherwise will start from 0
    _indexLabel.text = [NSString stringWithFormat:@"%d/%lu", index+1, (unsigned long)_pinYinWithoutToneArray.count];
}

@end