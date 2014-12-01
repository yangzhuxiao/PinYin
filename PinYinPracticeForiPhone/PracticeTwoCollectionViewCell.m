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
        _pinyinOneTextField = [[UITextField alloc] initWithFrame:CGRectMake(pinyinOneTextFieldXOriginPercent * frame.size.width, pinyinOneTextFieldYOriginPercent *frame.size.height, pinyinOneTextFieldWidthPercentWidth *frame.size.width, pinyinOneTextFieldHeightPercentWidth *frame.size.width)];
//        _pinyinOneTextField.placeholder = @"pinyin";
        _pinyinOneTextField.borderStyle = UITextBorderStyleRoundedRect;
        _pinyinOneTextField.textAlignment = NSTextAlignmentCenter;
        _pinyinOneTextField.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:pinyinOneTextFieldFontPercentWidth*frame.size.width];
        _pinyinOneTextField.placeholder = @"pin yin";
        
// pinyinTwoTextField
        _pinyinTwoTextField = [[UITextField alloc] initWithFrame:CGRectMake(pinyinTwoTextFieldXOriginPercent * frame.size.width, pinyinTwoTextFieldYOriginPercent *frame.size.height, pinyinTwoTextFieldWidthPercentWidth *frame.size.width, pinyinTwoTextFieldHeightPercentWidth *frame.size.width)];
        
        _pinyinTwoTextField.borderStyle = UITextBorderStyleRoundedRect;
        _pinyinTwoTextField.textAlignment = NSTextAlignmentCenter;
        _pinyinTwoTextField.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:pinyinTwoTextFieldFontPercentWidth*frame.size.width];
        _pinyinTwoTextField.placeholder = @"pin yin";
        
// ToneLabelOne
        _toneLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * ToneLabelOneXOriginPercent, frame.size.height * ToneLabelOneYOriginPercent, frame.size.width * ToneLabelOneWidthPercent, frame.size.height * ToneLabelOneHeightPercent)];
        _toneLabelOne.font = [UIFont systemFontOfSize:frame.size.width * ToneLabelOneFontPercentWidth];
        _toneLabelOne.textAlignment = NSTextAlignmentCenter;
//        _toneLabelOne.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _toneLabelOne.textColor = txtColor;
//        _toneLabelOne.layer.borderWidth = 1.0f;
        
// ToneLabelTwo
        _toneLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * ToneLabelTwoXOriginPercent, frame.size.height * ToneLabelTwoYOriginPercent, frame.size.width * ToneLabelTwoWidthPercent, frame.size.height * ToneLabelTwoHeightPercent)];
        _toneLabelTwo.font = [UIFont systemFontOfSize:frame.size.width * ToneLabelTwoFontPercentWidth];
        _toneLabelTwo.textAlignment = NSTextAlignmentCenter;
//        _toneLabelTwo.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _toneLabelTwo.textColor = txtColor;
//        _toneLabelTwo.layer.borderWidth = 1.0f;
        
        [self.contentView addSubview:_pinyinOneTextField];
        [self.contentView addSubview:_pinyinTwoTextField];
        
        [self.contentView addSubview:_toneLabelOne];
        [self.contentView addSubview:_toneLabelTwo];
    }
    return self;
}
@end
