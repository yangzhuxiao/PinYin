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
        // play button
        _playButton = [[UIButton alloc] initWithFrame:CGRectMake(PlayButtonForPracOneXOriginPercent * frame.size.width, PlayButtonForPracOneYOriginPercent * frame.size.height, PlayButtonForPracOneWidthPercent * frame.size.width, PlayButtonForPracOneHeightPercent * frame.size.height)];
        [_playButton setTitle:@"Replay" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _playButton.titleLabel.font = [UIFont systemFontOfSize:frame.size.width * PlayButtonForPracOneFontPercentWidth];
        
        _playButton.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2].CGColor;
        _playButton.layer.borderWidth = 1.0f;
        _playButton.layer.cornerRadius = 5.0f;
        
/*
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
*/
        // pinyinOneTextField
        _pinyinOneTextField = [[UITextField alloc] initWithFrame:CGRectMake(pinyinOneTextFieldXOriginPercent * frame.size.width, pinyinOneTextFieldYOriginPercent *frame.size.height, pinyinOneTextFieldWidthPercent *frame.size.width, pinyinOneTextFieldHeightPercent *frame.size.height)];
        _pinyinOneTextField.placeholder = @"Please input pinyin";
        _pinyinOneTextField.borderStyle = UITextBorderStyleRoundedRect;
        _pinyinOneTextField.textAlignment = NSTextAlignmentCenter;
        
        // pinyinTwoTextField
        _pinyinTwoTextField = [[UITextField alloc] initWithFrame:CGRectMake(pinyinTwoTextFieldXOriginPercent * frame.size.width, pinyinTwoTextFieldYOriginPercent *frame.size.height, pinyinTwoTextFieldWidthPercent *frame.size.width, pinyinTwoTextFieldHeightPercent *frame.size.height)];
        _pinyinTwoTextField.placeholder = @"Please input pinyin";
        _pinyinTwoTextField.borderStyle = UITextBorderStyleRoundedRect;
        _pinyinTwoTextField.textAlignment = NSTextAlignmentCenter;
        
/*
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
 */
        // PinYinLabelOne
        _toneLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * ToneLabelOneXOriginPercent, frame.size.height * ToneLabelOneYOriginPercent, frame.size.width * ToneLabelOneWidthPercent, frame.size.height * ToneLabelOneHeightPercent)];
        _toneLabelOne.font = [UIFont systemFontOfSize:frame.size.width * ToneLabelOneFontPercentWidth];
        _toneLabelOne.textAlignment = NSTextAlignmentCenter;
        _toneLabelOne.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _toneLabelOne.textColor = [UIColor blackColor];
        _toneLabelOne.layer.borderWidth = 1.0f;
        
        // PinYinLabelTwo
        _toneLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * ToneLabelTwoXOriginPercent, frame.size.height * ToneLabelTwoYOriginPercent, frame.size.width * ToneLabelTwoWidthPercent, frame.size.height * ToneLabelTwoHeightPercent)];
        _toneLabelTwo.font = [UIFont systemFontOfSize:frame.size.width * ToneLabelTwoFontPercentWidth];
        _toneLabelTwo.textAlignment = NSTextAlignmentCenter;
        _toneLabelTwo.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _toneLabelTwo.textColor = [UIColor blackColor];
        _toneLabelTwo.layer.borderWidth = 1.0f;
        
        // confirmSelectionButton
        _confirmInputButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width * confirmSelectionButtonXOriginPercent, frame.size.height * confirmSelectionButtonYOriginPercent, frame.size.width * confirmSelectionButtonWidthPercent, frame.size.height * confirmSelectionButtonHeightPercent)];
        
        [_confirmInputButton setTitle:@"Confirm" forState:UIControlStateNormal];
        [_confirmInputButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _confirmInputButton.titleLabel.font = [UIFont systemFontOfSize:frame.size.width * confirmSelectionButtonFontPercentWidth];
        
        _confirmInputButton.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2].CGColor;
        _confirmInputButton.layer.borderWidth = 1.0f;
        _confirmInputButton.layer.cornerRadius = 5.0f;
        
        // congratulateLabel
        _congratulateLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * congratulateLabelXOriginPercent, frame.size.height * congratulateLabelYOriginPercent, frame.size.width * congratulateLabelWidthPercent, frame.size.height * congratulateLabelHeightPercent)];
        _congratulateLabel.text = @"Congratulations!";
        _congratulateLabel.font = [UIFont systemFontOfSize:frame.size.width * congratulateLabelFontPercentWidth];
        _congratulateLabel.textAlignment = NSTextAlignmentCenter;
        _congratulateLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _congratulateLabel.textColor = [UIColor blackColor];
        _congratulateLabel.layer.borderWidth = 1.0f;
        
        //        _congratulateLabel.hidden = YES;
        
        // righAnswerLabel
        _righAnswerLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * congratulateLabelXOriginPercent, frame.size.height * congratulateLabelYOriginPercent, frame.size.width * congratulateLabelWidthPercent, frame.size.height * congratulateLabelHeightPercent)];
        _righAnswerLabel.font = [UIFont systemFontOfSize:frame.size.width * righAnswerLabelFontPercentWidth];
        _righAnswerLabel.textAlignment = NSTextAlignmentCenter;
        _righAnswerLabel.numberOfLines = 0;
        _righAnswerLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _righAnswerLabel.textColor = [UIColor blackColor];
        _righAnswerLabel.layer.borderWidth = 1.0f;
        
        //        _righAnswerLabel.hidden = YES;
        
        [self.contentView addSubview:_playButton];
//        [self.contentView addSubview:_SelectToneIndicatorLabelOne];
//        [self.contentView addSubview:_SelectToneIndicatorLabelTwo];
        
        [self.contentView addSubview:_pinyinOneTextField];
        [self.contentView addSubview:_pinyinTwoTextField];
        
        [self.contentView addSubview:_toneLabelOne];
        [self.contentView addSubview:_toneLabelTwo];
        [self.contentView addSubview:_confirmInputButton];
        [self.contentView addSubview:_congratulateLabel];
        [self.contentView addSubview:_righAnswerLabel];
        
    }
    return self;
}
@end
