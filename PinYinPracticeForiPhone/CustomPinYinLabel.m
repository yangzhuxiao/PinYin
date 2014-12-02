//
//  CustomPinYinLabel.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/2/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomPinYinLabel.h"
#import "Constants.h"

@implementation CustomPinYinLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:frame.size.height * PinYinLabelFontPercentLabelHeight];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = txtColor;
    }
    return self;
}

@end
