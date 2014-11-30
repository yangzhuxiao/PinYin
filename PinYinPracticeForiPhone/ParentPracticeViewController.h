//
//  ParentPracticeViewController.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ParentPracticeViewController : UIViewController < UIScrollViewDelegate >

// UI
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (strong, nonatomic) UICollectionView *itemCollectionView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *indexLabel;
@property (nonatomic, strong) UILabel *countLabel;

// Data
@property (nonatomic, copy) NSArray *pinYinWithoutToneArray;
@property (nonatomic, copy) NSArray *pinYinWithToneArray;
@property (nonatomic, copy) NSArray *tonesArray;

@property (nonatomic, copy) NSString *firstTone;
@property (nonatomic, copy) NSString *secondTone;
@property (nonatomic, copy) NSString *tempFirstTone;
@property (nonatomic, copy) NSString *tempSecondTone;

@property (nonatomic, copy) NSString *firstPinyin;
@property (nonatomic, copy) NSString *secondPinyin;

@property (nonatomic, assign) NSInteger correctNumber;
@property (nonatomic, assign) NSInteger currentIndex;


- (void)updateCountLabel;


@end
