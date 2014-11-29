//
//  PracticeThreeCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentPracticeCollectionViewCell.h"

@interface PracticeThreeCollectionViewCell : ParentPracticeCollectionViewCell

@property (nonatomic, strong) UITextField *pinyinOneTextField;
@property (nonatomic, strong) UITextField *pinyinTwoTextField;

@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelOne;
@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelTwo;

@end
