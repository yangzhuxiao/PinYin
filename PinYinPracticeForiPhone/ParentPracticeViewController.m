//
//  ParentPracticeViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ParentPracticeViewController.h"
#import "PhraseManager.h"
#import "Constants.h"
#import <FontAwesomeKit/FAKIonIcons.h>

@implementation ParentPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //correctNumber is initialized as 0
    _correctNumber = 0;
    _currentIndex = 0;
    
    // must not be omitted, otherwise the color of subview "collectionView" will crash
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = [[PhraseManager sharedManager] randomlizedPhrasesOfCountOneHundred];
    
    // The order of the following three must not be changed !
    [self setUpCollectionView];
    [self setUpBackButton];
    [self setUpIndexLabel];
    
    // repare audioPlayer and play once
    [self setUpCountLabel];
//    [self setUpIndicatorView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _itemCollectionView.scrollEnabled = NO;
}

- (void)setUpCountLabel
{
    _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(CountLabelXOriginPercent *WIDTH, CountLabelYOriginPercent *HEIGHT, CountLabelWidthPercent *WIDTH, CountLabelHeightPercent *HEIGHT)];
    _countLabel.font = [UIFont systemFontOfSize:self.view.frame.size.width * CountLabelFontPercentWidth];
    _countLabel.textAlignment = NSTextAlignmentRight;
    _countLabel.textColor = txtColor;
    _countLabel.numberOfLines = 0;
    // must initialize, otherwise won't be able to see it at first!

    _countLabel.text = @"Correct/All\n0/0";
    
    [self updateCountLabel];
    
    [self.view addSubview:_countLabel];
}

- (void)updateCountLabel
{
    _countLabel.text = [NSString stringWithFormat:@"Correct/All\n%ld/%lu", (long)_correctNumber, (unsigned long)_currentIndex];
}

- (void)setUpCollectionView
{
    //Item collection
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    _itemCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0, 0.0, ItemColletionViewWidth, ItemColletionViewHeight) collectionViewLayout:layout];
    layout.itemSize = _itemCollectionView.bounds.size;
    _itemCollectionView.pagingEnabled = YES;
    _itemCollectionView.showsHorizontalScrollIndicator = NO;
    _itemCollectionView.alwaysBounceHorizontal = NO;
    _itemCollectionView.backgroundColor = bgColor;

    [self.view addSubview:_itemCollectionView];
}

- (void)setUpBackButton
{
    _backButton = [[CustomBackButton alloc] initWithFrame:CGRectMake(BackButtonXOriginPercent *WIDTH, BackButtonYOriginPercent *HEIGHT, BackButtonWidthPercentWidth*WIDTH, BackButtonHeightPercentWidth*WIDTH)];
    [_backButton addTarget:self action:@selector(backToRoot:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_backButton];
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
    [_audioPlayer setDelegate:self];
    [_audioPlayer setNumberOfLoops:0];
    [_audioPlayer setVolume:1];
    [_audioPlayer prepareToPlay];
    [_audioPlayer play];
}

- (void)backToRoot:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
