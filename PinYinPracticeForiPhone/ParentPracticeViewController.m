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
    _wrongNumber = 0;
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
    [self setUpContentLabel];
    [self setUpHelpButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _itemCollectionView.scrollEnabled = NO;
}

- (void)setUpCountLabel
{
    _correctToWrongLabel = [[CustomCorrectToWrongLabel alloc] initWithFrame:
                            CGRectMake(CountLabelXOriginPercent *WIDTH,
                                       CountLabelYOriginPercent *HEIGHT,
                                       
                                       CountLabelWidthPercent *WIDTH, CountLabelHeightPercent *HEIGHT)];
    // must initialize, otherwise won't be able to see it at first!

    _correctToWrongLabel.text = @"0:0";
    
    [self updateCountLabel];
    
    [self.view addSubview:_correctToWrongLabel];
}

- (void)updateCountLabel
{
    _correctToWrongLabel.text = [NSString stringWithFormat:@"%ld:%ld", (long)_correctNumber, (long)_wrongNumber];
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

- (void)setUpContentLabel
{
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.1*WIDTH, 0.1*HEIGHT, 0.8*WIDTH, 0.6*HEIGHT)];
    _contentLabel.numberOfLines = 0;
    //    contentLabel.font = [UIFont systemFontOfSize:]
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    _contentLabel.textColor = [UIColor blackColor];
}

- (void)setUpHelpButton
{
    FAKIonIcons *helpIcon = [FAKIonIcons ios7HelpOutlineIconWithSize:0.10*WIDTH];
    UIImage *helpImage = [helpIcon imageWithSize:CGSizeMake(0.10*WIDTH, 0.10*WIDTH)];
    _helpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_helpButton setFrame:CGRectMake(0.75*WIDTH, 0.9*HEIGHT, 0.15*WIDTH, 0.15*WIDTH)];
    [_helpButton setImage:helpImage forState:UIControlStateNormal];
    
    [_helpButton addTarget:self action:@selector(showHelpPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_helpButton];
}

- (void)showHelpPage
{
    _helpPage = [[UIControl alloc] initWithFrame:self.view.bounds];
    _helpPage.backgroundColor = [UIColor whiteColor];
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [okButton setFrame:CGRectMake(0.2*WIDTH, 0.8*HEIGHT, 0.6*WIDTH, 0.1*HEIGHT)];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(dismissHelpPage) forControlEvents:UIControlEventTouchUpInside];
    okButton.layer.borderWidth = 1.0;
    okButton.layer.borderColor = hightlightedColor.CGColor;
    okButton.layer.cornerRadius = 3.0;
    
    [_helpPage addSubview:_contentLabel];
    [_helpPage addSubview:okButton];
    [self.view addSubview:_helpPage];
}

- (void)dismissHelpPage
{
    [_helpPage removeFromSuperview];
}

- (void)backToRoot:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
