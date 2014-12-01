//
//  CollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/25/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ItemCollectionViewCell.h"
#import <FontAwesomeKit/FAKIonIcons.h>

#import "Constants.h"

@implementation ItemCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // play button
        _playButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_playButton setFrame:CGRectMake(PlayButtonXOriginPercent * frame.size.width, PlayButtonYOriginPercent * frame.size.height, PlayButtonWidthPercentWidth*frame.size.width, PlayButtonHeightPercentWidth*frame.size.width)];
        _playButton.layer.borderWidth = 1.0f;
        _playButton.layer.cornerRadius = 3.0f;
        _playButton.layer.borderColor = bdColor.CGColor;
        
        FAKIcon *playIconNormal = [FAKIonIcons ios7PlayIconWithSize:PlayButtonHeightPercentWidth*frame.size.width];
        playIconNormal.drawingPositionAdjustment = UIOffsetMake(PlayButtonWidthPercentWidth * frame.size.width*0.05, 0);
        UIImage *playImageNormal = [playIconNormal imageWithSize:CGSizeMake(_playButton.frame.size.width, _playButton.frame.size.height)];
        [_playButton setImage:playImageNormal forState:UIControlStateNormal];
        _playButton.showsTouchWhenHighlighted = YES;
        
        // word label
        _wordLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * WordLabelXOriginPercent, frame.size.height * WordLabelYOriginPercent, frame.size.width * WordLabelWidthPercent, frame.size.height * WordLabelHeightPercent)];
//        _wordLabel.font = [UIFont systemFontOfSize:frame.size.width * WordLabelFontPercentWidth];
        _wordLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:frame.size.width * WordLabelFontPercentWidth];
        _wordLabel.numberOfLines = 0;
        _wordLabel.textAlignment = NSTextAlignmentCenter;
        _wordLabel.textColor = txtColor;
        
        [self.contentView addSubview:_playButton];
        [self.contentView addSubview:_wordLabel];
    }
    return self;
}




@end
