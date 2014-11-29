//
//  PracticeThreeCollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeThreeCollectionViewCell.h"
#import "Constants.h"

@implementation PracticeThreeCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
// SelectToneIndicatorLabel - One
        _SelectToneIndicatorLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(SelectToneIndicatorLabelOneXOriginPercent * frame.size.width, SelectToneIndicatorLabelOneYOriginPercent *frame.size.height, SelectToneIndicatorLabelOneWidthPercent * frame.size.width, SelectToneIndicatorLabelOneHeightPercent * frame.size.height)];
        _SelectToneIndicatorLabelOne.text = @" Pick a tone for the first pinyin";
        _SelectToneIndicatorLabelOne.font = [UIFont systemFontOfSize:frame.size.width * SelectToneIndicatorLabelOneFontPercentWidth];
        _SelectToneIndicatorLabelOne.textAlignment = NSTextAlignmentLeft;
        _SelectToneIndicatorLabelOne.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _SelectToneIndicatorLabelOne.textColor = [UIColor blackColor];
        _SelectToneIndicatorLabelOne.layer.borderWidth = 1.0f;
        
// SelectToneIndicatorLabel - Two
        _SelectToneIndicatorLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(SelectToneIndicatorLabelTwoXOriginPercent * frame.size.width, SelectToneIndicatorLabelTwoYOriginPercent *frame.size.height, SelectToneIndicatorLabelTwoWidthPercent * frame.size.width, SelectToneIndicatorLabelTwoHeightPercent * frame.size.height)];
        _SelectToneIndicatorLabelTwo.text = @" Pick a tone for the second pinyin";
        _SelectToneIndicatorLabelTwo.font = [UIFont systemFontOfSize:frame.size.width * SelectToneIndicatorLabelTwoFontPercentWidth];
        _SelectToneIndicatorLabelTwo.textAlignment = NSTextAlignmentLeft;
        _SelectToneIndicatorLabelTwo.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _SelectToneIndicatorLabelTwo.textColor = [UIColor blackColor];
        _SelectToneIndicatorLabelTwo.layer.borderWidth = 1.0f;
        
        
// ToneButtons
        for (int i = 0; i < 2; i++) {
            for (int j=0; j<5; j++) {
                UIButton *toneLabel = [[UIButton alloc] initWithFrame:CGRectMake((ToneButtonBasicXOriginPercent + j * ToneButtonXSpaceWidthPercent) * frame.size.width, (ToneButtonBasicYOriginPercent + i * ToneButtonYSpaceHeightPercent) *frame.size.height, ToneButtonBasicWidthPercent * frame.size.width, ToneButtonBasicHeightPercent * frame.size.height)];
                
                NSString *buttonText;
                switch (j) {
                    case 0:
                        buttonText = @"light";
                        break;
                    case 1:
                        buttonText = @"ˉ";
                        break;
                    case 2:
                        buttonText = @"ˊ";
                        break;
                    case 3:
                        buttonText = @"ˇ";
                        break;
                    case 4:
                        buttonText = @"ˋ";
                        break;
                        
                    default:
                        break;
                }
                [toneLabel setTitle:buttonText forState:UIControlStateNormal];
                [toneLabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                toneLabel.titleLabel.font = [UIFont systemFontOfSize:frame.size.width * ToneButtonBasicFontPercentWidth];
                
                toneLabel.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2].CGColor;
                toneLabel.layer.borderWidth = 1.0f;
                toneLabel.layer.cornerRadius = 5.0f;
                toneLabel.tag = i*10+j;
                [self.contentView addSubview:toneLabel];
            }
        }
        
// pinyinOneTextField
        _pinyinOneTextField = [[UITextField alloc] initWithFrame:CGRectMake(pinyinOneTextFieldForPrac3XOriginPercent * frame.size.width, pinyinOneTextFieldForPrac3YOriginPercent *frame.size.height, pinyinOneTextFieldWidthPercent *frame.size.width, pinyinOneTextFieldHeightPercent *frame.size.height)];
        _pinyinOneTextField.placeholder = @"Please input pinyin";
        _pinyinOneTextField.borderStyle = UITextBorderStyleRoundedRect;
        _pinyinOneTextField.textAlignment = NSTextAlignmentCenter;
        
// pinyinTwoTextField
        _pinyinTwoTextField = [[UITextField alloc] initWithFrame:CGRectMake(pinyinTwoTextFieldForPrac3XOriginPercent * frame.size.width, pinyinTwoTextFieldForPrac3YOriginPercent *frame.size.height, pinyinTwoTextFieldForPrac3WidthPercent *frame.size.width, pinyinTwoTextFieldForPrac3HeightPercent *frame.size.height)];
        _pinyinTwoTextField.placeholder = @"Please input pinyin";
        _pinyinTwoTextField.borderStyle = UITextBorderStyleRoundedRect;
        _pinyinTwoTextField.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_SelectToneIndicatorLabelOne];
        [self.contentView addSubview:_SelectToneIndicatorLabelTwo];
        
        [self.contentView addSubview:_pinyinOneTextField];
        [self.contentView addSubview:_pinyinTwoTextField];
    }
    return self;
}

@end
