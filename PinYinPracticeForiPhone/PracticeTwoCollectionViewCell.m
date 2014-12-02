//
//  PracticeTwoCollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeTwoCollectionViewCell.h"
#import "Constants.h"

@implementation PracticeTwoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

// pinyinOneTextField
        _pinyinOneTextField = [[CustomPinyinTextField alloc] initWithFrame:
                               CGRectMake(pinyinOneTextFieldForPrac2XOriginPercent * frame.size.width,
                                          pinyinOneTextFieldForPrac2YOriginPercent *frame.size.height,
                                          pinyinTextFieldWidthPercentWidth *frame.size.width,
                                          pinyinTextFieldHeightPercentWidth *frame.size.width)];
        
// pinyinTwoTextField
        _pinyinTwoTextField = [[CustomPinyinTextField alloc] initWithFrame:
                               CGRectMake(pinyinTwoTextFieldForPrac2XOriginPercent * frame.size.width,
                                          pinyinTwoTextFieldForPrac2YOriginPercent *frame.size.height,
                                          pinyinTextFieldWidthPercentWidth *frame.size.width,
                                          pinyinTextFieldHeightPercentWidth *frame.size.width)];
        
// ToneLabelOne
        _toneLabelOne = [[CustomToneLabel alloc] initWithFrame:CGRectMake
                         (frame.size.width * ToneLabelOneForPrac3XOriginPercentWidth,
                          frame.size.height * ToneLabelOneForPrac3YOriginPercentHeight,
                          frame.size.width * ToneLabelWidthPercentWidth,
                          frame.size.width * ToneLabelHeightPercentWidth)];

        
// ToneLabelTwo
        _toneLabelTwo = [[CustomToneLabel alloc] initWithFrame:CGRectMake
                         (frame.size.width * ToneLabelTwoForPrac3XOriginPercentWidth,
                          frame.size.height * ToneLabelTwoForPrac3YOriginPercentHeight,
                          frame.size.width * ToneLabelWidthPercentWidth,
                          frame.size.width * ToneLabelHeightPercentWidth)];

        [self.contentView addSubview:_pinyinOneTextField];
        [self.contentView addSubview:_pinyinTwoTextField];
        
        [self.contentView addSubview:_toneLabelOne];
        [self.contentView addSubview:_toneLabelTwo];
    }
    return self;
}
@end
