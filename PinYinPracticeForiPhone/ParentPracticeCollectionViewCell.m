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
        _confirmSelectionButton = [[CustomConfirmButton alloc] initWithFrame:CGRectMake
                                   (frame.size.width * confirmSelectionButtonXOriginPercent,
                                    frame.size.height * confirmSelectionButtonYOriginPercent,
                                    frame.size.width * confirmSelectionButtonWidthPercentWidth,
                                    frame.size.width * confirmSelectionButtonHeightPercentWidth)];
        
// congratulateLabel
        _congratulateLabel = [[CustomCongratulationLabel alloc] initWithFrame:
                              CGRectMake(frame.size.width * congratulateLabelXOriginPercent,
                                         frame.size.height * congratulateLabelYOriginPercent,
                                         frame.size.width * congratulateLabelWidthPercent,
                                         frame.size.height * congratulateLabelHeightPercent)];
        
// righAnswerLabel
        _righAnswerLabel = [[CustomRightAnswerLabel alloc] initWithFrame:
                            CGRectMake(frame.size.width * rightAnswerLabelXOriginPercent,
                                       frame.size.height * rightAnswerLabelYOriginPercent,
                                       frame.size.width * rightAnswerLabelWidthPercent,
                                       frame.size.height * rightAnswerLabelHeightPercent)];
        
        [self.contentView addSubview:_playButton];
        [self.contentView addSubview:_confirmSelectionButton];
        [self.contentView addSubview:_congratulateLabel];
        [self.contentView addSubview:_righAnswerLabel];
    }
    return self;
}


@end
