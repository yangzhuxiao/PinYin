//
//  ListenItemViewController.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/25/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "CustomAutoPlayButton.h"
#import "CustomBackButton.h"

@interface ListenItemViewController : UIViewController

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (strong, nonatomic) UICollectionView *itemCollectionView;

@property (nonatomic, strong) CustomBackButton *backButton;
@property (nonatomic, strong) CustomAutoPlayButton *autoPlayButton;
@property (nonatomic, strong) UILabel *indexLabel;

@property (nonatomic, assign) int tag;

@end
