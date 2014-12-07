//
//  ParentPracticeViewController.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Phrase.h"
#import "CustomBackButton.h"
#import "CustomCorrectToWrongLabel.h"

@interface ParentPracticeViewController : UIViewController < UIScrollViewDelegate, AVAudioPlayerDelegate, UIAlertViewDelegate >

// UI
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (strong, nonatomic) UICollectionView *itemCollectionView;
@property (nonatomic, strong) CustomBackButton *backButton;
@property (nonatomic, strong) UILabel *indexLabel;
@property (nonatomic, strong) CustomCorrectToWrongLabel *correctToWrongLabel;

@property (nonatomic, strong) UIButton *selectedButtonFirstRow;
@property (nonatomic, strong) UIButton *selectedButtonSecondRow;

// infoButton for help page
@property (nonatomic, strong) UIButton *helpButton;
@property (nonatomic, strong) UIControl *helpPage;
@property (nonatomic, strong) UILabel *contentLabel;

// Data
@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, copy) NSString *firstTone;
@property (nonatomic, copy) NSString *secondTone;
@property (nonatomic, copy) NSString *tempFirstTone;
@property (nonatomic, copy) NSString *tempSecondTone;

@property (nonatomic, copy) NSString *firstPinyin;
@property (nonatomic, copy) NSString *secondPinyin;

@property (nonatomic, assign) NSInteger correctNumber;
@property (nonatomic, assign) NSInteger wrongNumber;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) Phrase *currentPhrase;

- (void)updateCountLabel;
- (void)setUpAudioPlayerWithMp3FilePath:(NSString *)mp3Path;

@end
