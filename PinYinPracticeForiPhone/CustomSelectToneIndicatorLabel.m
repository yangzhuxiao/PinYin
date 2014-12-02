//
//  CustomSelectToneIndicatorLabel.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/2/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomSelectToneIndicatorLabel.h"
#import "Constants.h"

@implementation CustomSelectToneIndicatorLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.font = [UIFont systemFontOfSize:frame.size.width * SelectToneIndicatorLabelOneFontPercentWidth];
        self.textAlignment = NSTextAlignmentLeft;
        self.textColor = txtColor;
    }
    return self;
}

@end
