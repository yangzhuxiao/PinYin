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
        _playButton = [[CustomPlayMp3Button alloc] initWithFrame:CGRectMake(PlayButtonXOriginPercent * frame.size.width, PlayButtonYOriginPercent * frame.size.height, PlayButtonWidthPercentWidth*frame.size.width, PlayButtonHeightPercentWidth*frame.size.width)];
        
        // word label
        _wordLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width * WordLabelXOriginPercent, frame.size.height * WordLabelYOriginPercent, frame.size.width * WordLabelWidthPercent, frame.size.height * WordLabelHeightPercent)];
        _wordLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:frame.size.width * WordLabelFontPercentWidth];
        _wordLabel.numberOfLines = 0;
        _wordLabel.textAlignment = NSTextAlignmentCenter;
        _wordLabel.textColor = txtColor;
        
        [self.contentView addSubview:_playButton];
        [self.contentView addSubview:_wordLabel];
    }
    return self;
}




@end
