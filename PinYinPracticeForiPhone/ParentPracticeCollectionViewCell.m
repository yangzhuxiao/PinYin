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
        _playButton = [[UIButton alloc] initWithFrame:CGRectMake(PlayButtonXOriginPercent * frame.size.width, PlayButtonYOriginPercent * frame.size.height, PlayButtonWidthPercent * frame.size.width, PlayButtonHeightPercent * frame.size.height)];
        [_playButton setTitle:@"Replay" forState:UIControlStateNormal];
        [_playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _playButton.titleLabel.font = [UIFont systemFontOfSize:frame.size.width * PlayButtonFontPercentWidth];
        
        _playButton.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2].CGColor;
        _playButton.layer.borderWidth = 1.0f;
        _playButton.layer.cornerRadius = 5.0f;
        
        // word label
        _wordLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * WordLabelXOriginPercent, frame.size.height * WordLabelYOriginPercent, frame.size.width * WordLabelWidthPercent, frame.size.height * WordLabelHeightPercent)];
        _wordLabel.font = [UIFont systemFontOfSize:frame.size.width * WordLabelFontPercentWidth];
        _wordLabel.textAlignment = NSTextAlignmentCenter;
        _wordLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
        _wordLabel.textColor = [UIColor blackColor];
        _wordLabel.layer.borderWidth = 1.0f;
        //        _wordLabel.layer.cornerRadius = 8.0f;
        
        [self.contentView addSubview:_playButton];
        [self.contentView addSubview:_wordLabel];
    }
    return self;
}

@end
