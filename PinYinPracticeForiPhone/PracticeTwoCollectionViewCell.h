//
//  PracticeTwoCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PracticeTwoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *playButton;

@property (nonatomic, strong) UILabel *toneLabelOne;
@property (nonatomic, strong) UILabel *toneLabelTwo;

@property (nonatomic, strong) UITextField *pinyinOneTextField;
@property (nonatomic, strong) UITextField *pinyinTwoTextField;

//@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelOne;
//@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelTwo;

@property (nonatomic, strong) UIButton *confirmInputButton;

@property (nonatomic, strong) UILabel *congratulateLabel;
@property (nonatomic, strong) UILabel *righAnswerLabel;

@end
