//
//  PracticeTwoCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentPracticeCollectionViewCell.h"

@interface PracticeTwoCollectionViewCell : ParentPracticeCollectionViewCell

@property (nonatomic, strong) UILabel *toneLabelOne;
@property (nonatomic, strong) UILabel *toneLabelTwo;

@property (nonatomic, strong) UITextField *pinyinOneTextField;
@property (nonatomic, strong) UITextField *pinyinTwoTextField;

@end
