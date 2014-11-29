//
//  PracticeOneCollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeOneCollectionViewCell.h"
#import "Constants.h"

@implementation PracticeOneCollectionViewCell

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
        
        // PinYinLabelOne
        _PinYinLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * PinYinLabelOneXOriginPercent, frame.size.height * PinYinLabelOneYOriginPercent, frame.size.width * PinYinLabelOneWidthPercent, frame.size.height * PinYinLabelOneHeightPercent)];
        _PinYinLabelOne.font = [UIFont systemFontOfSize:frame.size.width * PinYinLabelOneFontPercentWidth];
        _PinYinLabelOne.textAlignment = NSTextAlignmentCenter;
        _PinYinLabelOne.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _PinYinLabelOne.textColor = [UIColor blackColor];
        _PinYinLabelOne.layer.borderWidth = 1.0f;
        
        // PinYinLabelTwo
        _PinYinLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * PinYinLabelTwoXOriginPercent, frame.size.height * PinYinLabelTwoYOriginPercent, frame.size.width * PinYinLabelTwoWidthPercent, frame.size.height * PinYinLabelTwoHeightPercent)];
        _PinYinLabelTwo.font = [UIFont systemFontOfSize:frame.size.width * PinYinLabelTwoFontPercentWidth];
        _PinYinLabelTwo.textAlignment = NSTextAlignmentCenter;
        _PinYinLabelTwo.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _PinYinLabelTwo.textColor = [UIColor blackColor];
        _PinYinLabelTwo.layer.borderWidth = 1.0f;

        [self.contentView addSubview:_SelectToneIndicatorLabelOne];
        [self.contentView addSubview:_SelectToneIndicatorLabelTwo];
        [self.contentView addSubview:_PinYinLabelOne];
        [self.contentView addSubview:_PinYinLabelTwo];
    }
    return self;
}

@end
