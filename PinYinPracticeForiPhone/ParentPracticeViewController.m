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

@implementation ParentPracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //correctNumber is initialized as 0
    _correctNumber = 0;
    _currentIndex = 0;
    
    // must not be omitted, otherwise the color of subview "collectionView" will crash
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = [[PhraseManager sharedManager] randomOrderedAllPhrases];
    
    // The order of the following three must not be changed !
    [self setUpCollectionViewAndPageControl];
    [self setUpBackButton];
    [self setUpIndexLabel];
    
    // repare audioPlayer and play once
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
//    _countLabel.text = [NSString stringWithFormat:@"1/%lu", (unsigned long)_pinYinWithoutToneArray.count];
    _countLabel.text = @"0/0";
    
    [self updateCountLabel];
    
    [self.view addSubview:_countLabel];
}

- (void)updateCountLabel
{
    _countLabel.text = [NSString stringWithFormat:@"Correct/All: %ld/%lu", (long)_correctNumber, (unsigned long)_currentIndex];
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
    _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_backButton setFrame:CGRectMake(BackButtonXOriginPercent *WIDTH, BackButtonYOriginPercent *HEIGHT, BackButtonWidthPercentWidth*WIDTH, BackButtonHeightPercentWidth*WIDTH)];
    
    [_backButton setImage:[UIImage imageNamed:@"close-100.png"] forState:UIControlStateNormal];
    _backButton.showsTouchWhenHighlighted = YES;
    
//    [_backButton setTitle:@"<<Exit" forState:UIControlStateNormal];
//    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    _backButton.titleLabel.font = [UIFont boldSystemFontOfSize:self.view.frame.size.width * BackButtonFontPercentWidth];
//    _backButton.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1].CGColor;
//    _backButton.layer.borderWidth = 1.0f;
//    _backButton.layer.cornerRadius = 5.0f;
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

- (void)backToRoot:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_audioPlayer stop];
    _audioPlayer.currentTime = 0;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [_selectedButtonSecondRow setSelected:NO];
    [_selectedButtonFirstRow setSelected:NO];
    _selectedButtonFirstRow = nil;
    _selectedButtonSecondRow = nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/self.view.frame.size.width;
    
    _audioPlayer = nil;
    _currentPhrase = _dataArray[index];
    [self setUpAudioPlayerWithMp3FilePath:_currentPhrase.mp3Path];
    
    // figure out the page down the view, must be "index+1", otherwise will start from 0
    _indexLabel.text = [NSString stringWithFormat:@"%d/%lu", index+1, (unsigned long)_dataArray.count];
}

@end
