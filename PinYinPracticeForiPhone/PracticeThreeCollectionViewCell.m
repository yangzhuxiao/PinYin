//
//  PracticeThreeCollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeThreeCollectionViewCell.h"
#import "Constants.h"
#import "CustomToneButton.h"

@implementation PracticeThreeCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // SelectToneIndicatorLabel - One
        _SelectToneIndicatorLabelOne = [[CustomSelectToneIndicatorLabel alloc] initWithFrame:CGRectMake(SelectToneIndicatorLabelOneXOriginPercent * frame.size.width, SelectToneIndicatorLabelOneYOriginPercent *frame.size.height, SelectToneIndicatorLabelOneWidthPercent * frame.size.width, SelectToneIndicatorLabelOneHeightPercent * frame.size.height)];
        _SelectToneIndicatorLabelOne.text = @" Pick a tone for the first pinyin";
        
        // SelectToneIndicatorLabel - Two
        _SelectToneIndicatorLabelTwo = [[CustomSelectToneIndicatorLabel alloc] initWithFrame:CGRectMake(SelectToneIndicatorLabelTwoXOriginPercent * frame.size.width, SelectToneIndicatorLabelTwoYOriginPercent *frame.size.height, SelectToneIndicatorLabelTwoWidthPercent * frame.size.width, SelectToneIndicatorLabelTwoHeightPercent * frame.size.height)];
        _SelectToneIndicatorLabelTwo.text = @" Pick a tone for the second pinyin";
        
        // ToneButtons
        for (int i = 0; i < 2; i++) {
            for (int j=0; j<5; j++) {
                CustomToneButton *toneButton =
                [[CustomToneButton alloc] initWithFrame:
                 CGRectMake(
                            (ToneButtonBasicXOriginPercent + j * ToneButtonXSpaceWidthPercent) * frame.size.width,
                            (ToneButtonBasicYOriginPercent + i * ToneButtonYSpaceHeightPercent) *frame.size.height,
                            ToneButtonBasicWidthPercent * frame.size.width,
                            ToneButtonBasicHeightPercent * frame.size.height)];
                NSMutableAttributedString *buttonText;
                switch (j) {
                    case 0:
                        buttonText = [[NSMutableAttributedString alloc] initWithString:(NSString *)firstToneString];
                        [buttonText addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:frame.size.width * ToneButtonBasicFontPercentWidth]} range:NSMakeRange(0, buttonText.length)];
                        break;
                    case 1:
                        buttonText = [[NSMutableAttributedString alloc] initWithString:(NSString *)secondToneString];
                        [buttonText addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:frame.size.width * ToneButtonBasicFontPercentWidth * 0.6]} range:NSMakeRange(0, buttonText.length)];
                        break;
                    case 2:
                        buttonText = [[NSMutableAttributedString alloc] initWithString:(NSString *)thirdToneString];
                        [buttonText addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:frame.size.width * ToneButtonBasicFontPercentWidth]} range:NSMakeRange(0, buttonText.length)];
                        break;
                    case 3:
                        buttonText = [[NSMutableAttributedString alloc] initWithString:(NSString *)fourthToneString];
                        [buttonText addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:frame.size.width * ToneButtonBasicFontPercentWidth * 0.6]} range:NSMakeRange(0, buttonText.length)];
                        break;
                    case 4:
                        buttonText = [[NSMutableAttributedString alloc] initWithString:(NSString *)lightToneString];
                        [buttonText addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:frame.size.width * ToneButtonBasicFontPercentWidth]} range:NSMakeRange(0, buttonText.length)];
                        break;
                    default:
                        break;
                }
                
                [toneButton setAttributedTitle:buttonText forState:UIControlStateNormal];
                toneButton.titleEdgeInsets = UIEdgeInsetsMake(toneButton.frame.size.height*0.8, -toneButton.frame.size.width*0.35, 0, 0);
                toneButton.tag = i*10+j;
                [self.contentView addSubview:toneButton];
            }
        }
        
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
        
        // pinyinOneTextField
        _pinyinOneTextField = [[CustomPinyinTextField alloc] initWithFrame:
                               CGRectMake(pinyinOneTextFieldForPrac3XOriginPercent * frame.size.width,
                                          pinyinOneTextFieldForPrac3YOriginPercent *frame.size.height,
                                          pinyinTextFieldWidthPercentWidth *frame.size.width,
                                          pinyinTextFieldHeightPercentWidth *frame.size.width)];
        
        // pinyinTwoTextField
        _pinyinTwoTextField = [[CustomPinyinTextField alloc] initWithFrame:
                               CGRectMake(pinyinTwoTextFieldForPrac3XOriginPercent * frame.size.width,
                                          pinyinTwoTextFieldForPrac3YOriginPercent *frame.size.height,
                                          pinyinTextFieldWidthPercentWidth *frame.size.width,
                                          pinyinTextFieldHeightPercentWidth *frame.size.width)];
        
        [self.contentView addSubview:_toneLabelOne];
        [self.contentView addSubview:_toneLabelTwo];
        
        [self.contentView addSubview:_SelectToneIndicatorLabelOne];
        [self.contentView addSubview:_SelectToneIndicatorLabelTwo];
        
        [self.contentView addSubview:_pinyinOneTextField];
        [self.contentView addSubview:_pinyinTwoTextField];
    }
    return self;
}

@end
