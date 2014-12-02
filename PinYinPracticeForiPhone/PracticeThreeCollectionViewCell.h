//
//  PracticeThreeCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentPracticeCollectionViewCell.h"
#import "CustomSelectToneIndicatorLabel.h"
#import "CustomPinyinTextField.h"

@interface PracticeThreeCollectionViewCell : ParentPracticeCollectionViewCell

@property (nonatomic, strong) CustomPinyinTextField *pinyinOneTextField;
@property (nonatomic, strong) CustomPinyinTextField *pinyinTwoTextField;

@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelOne;
@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelTwo;

@end
