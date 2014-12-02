//
//  PracticeOneCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentPracticeCollectionViewCell.h"
#import "CustomSelectToneIndicatorLabel.h"
#import "CustomPinYinLabel.h"
#import "CustomToneLabel.h"

@interface PracticeOneCollectionViewCell : ParentPracticeCollectionViewCell

@property (nonatomic, strong) CustomPinYinLabel *PinYinLabelOne;
@property (nonatomic, strong) CustomPinYinLabel *PinYinLabelTwo;

@property (nonatomic, strong) CustomSelectToneIndicatorLabel *SelectToneIndicatorLabelOne;
@property (nonatomic, strong) CustomSelectToneIndicatorLabel *SelectToneIndicatorLabelTwo;

@property (nonatomic, strong) CustomToneLabel *toneLabelOne;
@property (nonatomic, strong) CustomToneLabel *toneLabelTwo;

@end
