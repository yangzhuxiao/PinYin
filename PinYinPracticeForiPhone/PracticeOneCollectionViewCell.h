//
//  PracticeOneCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentPracticeCollectionViewCell.h"

@interface PracticeOneCollectionViewCell : ParentPracticeCollectionViewCell

@property (nonatomic, strong) UILabel *PinYinLabelOne;
@property (nonatomic, strong) UILabel *PinYinLabelTwo;

@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelOne;
@property (nonatomic, strong) UILabel *SelectToneIndicatorLabelTwo;

@end
