//
//  PracticeOneCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PracticeOneCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UILabel *PinYinLabelOne;
@property (nonatomic, strong) UILabel *PinYinLabelTwo;

@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelOne;
@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelTwo;

@property (nonatomic, strong) UIButton *confirmSelectionButton;

@property (nonatomic, strong) UILabel *congratulateLabel;
@property (nonatomic, strong) UILabel *righAnswerLabel;

@end
