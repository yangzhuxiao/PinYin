//
//  PracticeTwoCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentPracticeCollectionViewCell.h"
#import "CustomPinyinTextField.h"
#import "CustomToneLabel.h"

@interface PracticeTwoCollectionViewCell : ParentPracticeCollectionViewCell

@property (nonatomic, strong) CustomToneLabel *toneLabelOne;
@property (nonatomic, strong) CustomToneLabel *toneLabelTwo;

@property (nonatomic, strong) CustomPinyinTextField *pinyinOneTextField;
@property (nonatomic, strong) CustomPinyinTextField *pinyinTwoTextField;

@end
