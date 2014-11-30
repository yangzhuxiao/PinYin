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

@interface ParentPracticeViewController : UIViewController < UIScrollViewDelegate >

// UI
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (strong, nonatomic) UICollectionView *itemCollectionView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *indexLabel;
@property (nonatomic, strong) UILabel *countLabel;

// Data
@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, copy) NSString *firstTone;
@property (nonatomic, copy) NSString *secondTone;
@property (nonatomic, copy) NSString *tempFirstTone;
@property (nonatomic, copy) NSString *tempSecondTone;

@property (nonatomic, copy) NSString *firstPinyin;
@property (nonatomic, copy) NSString *secondPinyin;

@property (nonatomic, assign) NSInteger correctNumber;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) Phrase *currentPhrase;

- (void)updateCountLabel;
- (void)setUpAudioPlayerWithMp3FilePath:(NSString *)mp3Path;

@end
