//
//  ParentPracticeCollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ParentPracticeCollectionViewCell.h"
#import "Constants.h"

@implementation ParentPracticeCollectionViewCell

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
        
// confirmSelectionButton
        _confirmSelectionButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width * confirmSelectionButtonXOriginPercent, frame.size.height * confirmSelectionButtonYOriginPercent, frame.size.width * confirmSelectionButtonWidthPercent, frame.size.height * confirmSelectionButtonHeightPercent)];
        
        [_confirmSelectionButton setTitle:@"Confirm" forState:UIControlStateNormal];
        [_confirmSelectionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _confirmSelectionButton.titleLabel.font = [UIFont systemFontOfSize:frame.size.width * confirmSelectionButtonFontPercentWidth];
        
        _confirmSelectionButton.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2].CGColor;
        _confirmSelectionButton.layer.borderWidth = 1.0f;
        _confirmSelectionButton.layer.cornerRadius = 5.0f;
        
// congratulateLabel
        _congratulateLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * congratulateLabelXOriginPercent, frame.size.height * congratulateLabelYOriginPercent, frame.size.width * congratulateLabelWidthPercent, frame.size.height * congratulateLabelHeightPercent)];
        _congratulateLabel.text = @"Congratulations!";
        _congratulateLabel.font = [UIFont systemFontOfSize:frame.size.width * congratulateLabelFontPercentWidth];
        _congratulateLabel.textAlignment = NSTextAlignmentCenter;
        _congratulateLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _congratulateLabel.textColor = [UIColor blackColor];
        _congratulateLabel.layer.borderWidth = 1.0f;
        
// righAnswerLabel
        _righAnswerLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * congratulateLabelXOriginPercent, frame.size.height * congratulateLabelYOriginPercent, frame.size.width * congratulateLabelWidthPercent, frame.size.height * congratulateLabelHeightPercent)];
        _righAnswerLabel.font = [UIFont systemFontOfSize:frame.size.width * righAnswerLabelFontPercentWidth];
        _righAnswerLabel.textAlignment = NSTextAlignmentCenter;
        _righAnswerLabel.numberOfLines = 0;
        _righAnswerLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _righAnswerLabel.textColor = [UIColor blackColor];
        _righAnswerLabel.layer.borderWidth = 1.0f;
        
        [self.contentView addSubview:_playButton];
        [self.contentView addSubview:_confirmSelectionButton];
        [self.contentView addSubview:_congratulateLabel];
        [self.contentView addSubview:_righAnswerLabel];
    }
    return self;
}


@end
