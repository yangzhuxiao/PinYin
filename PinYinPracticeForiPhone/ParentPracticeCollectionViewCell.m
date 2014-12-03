//
//  ParentPracticeCollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ParentPracticeCollectionViewCell.h"
#import "Constants.h"
#import <FontAwesomeKit/FAKIonIcons.h>

@implementation ParentPracticeCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // play button
        _playButton = [[CustomPlayMp3Button alloc] initWithFrame:CGRectMake(PlayButtonXOriginPercent * frame.size.width, PlayButtonYOriginPercent * frame.size.height, PlayButtonWidthPercentWidth*frame.size.width, PlayButtonHeightPercentWidth*frame.size.width)];
        
// confirmSelectionButton
        _confirmSelectionButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width * confirmSelectionButtonXOriginPercent, frame.size.height * confirmSelectionButtonYOriginPercent, frame.size.width * confirmSelectionButtonWidthPercentWidth, frame.size.width * confirmSelectionButtonHeightPercentWidth)];
        
        [_confirmSelectionButton setTitle:@"Done" forState:UIControlStateNormal];
        [_confirmSelectionButton setTitleColor:txtColor forState:UIControlStateNormal];
        _confirmSelectionButton.titleLabel.font = [UIFont systemFontOfSize:frame.size.width * confirmSelectionButtonFontPercentWidth];
        
        _confirmSelectionButton.layer.borderWidth = 1.0f;
        _confirmSelectionButton.layer.cornerRadius = 5.0f;
        _confirmSelectionButton.layer.borderColor = bdColor.CGColor;

        
// congratulateLabel
        _congratulateLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * congratulateLabelXOriginPercent, frame.size.height * congratulateLabelYOriginPercent, frame.size.width * congratulateLabelWidthPercent, frame.size.height * congratulateLabelHeightPercent)];
        _congratulateLabel.text = @"Congratulations!";
        _congratulateLabel.font = [UIFont systemFontOfSize:frame.size.width * congratulateLabelFontPercentWidth];
        _congratulateLabel.textAlignment = NSTextAlignmentCenter;
        _congratulateLabel.textColor = txtColor;
        _congratulateLabel.layer.borderWidth = 1.0f;
        _congratulateLabel.layer.borderColor = bdColor.CGColor;
        
// righAnswerLabel
        _righAnswerLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * congratulateLabelXOriginPercent, frame.size.height * congratulateLabelYOriginPercent, frame.size.width * congratulateLabelWidthPercent, frame.size.height * congratulateLabelHeightPercent)];
        _righAnswerLabel.font = [UIFont systemFontOfSize:frame.size.width * righAnswerLabelFontPercentWidth];
        _righAnswerLabel.textAlignment = NSTextAlignmentCenter;
        _righAnswerLabel.numberOfLines = 0;
        _righAnswerLabel.textColor = txtColor;
        _righAnswerLabel.layer.borderWidth = 1.0f;
        _righAnswerLabel.layer.borderColor = bdColor.CGColor;
        
        [self.contentView addSubview:_playButton];
        [self.contentView addSubview:_confirmSelectionButton];
        [self.contentView addSubview:_congratulateLabel];
        [self.contentView addSubview:_righAnswerLabel];
    }
    return self;
}


@end
