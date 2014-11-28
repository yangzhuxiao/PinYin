//
//  PracticeThreeViewController.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PracticeThreeViewController : UIViewController

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (strong, nonatomic) UICollectionView *itemCollectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *indexLabel;

@property (nonatomic, strong) UILabel *countLabel;

@end
