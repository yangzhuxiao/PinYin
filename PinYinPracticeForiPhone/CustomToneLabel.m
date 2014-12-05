//
//  CustomToneLabel.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/2/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomToneLabel.h"
#import "Constants.h"

@implementation CustomToneLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:frame.size.height * ToneLabelFontPercentLabelHeight];
        self.font = [UIFont systemFontOfSize:frame.size.height * ToneLabelFontPercentLabelHeight];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = txtColor;
    }
    return self;
}


@end