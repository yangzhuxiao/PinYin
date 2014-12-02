//
//  CustomPinyinTextField.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/2/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomPinyinTextField.h"
#import "Constants.h"

@implementation CustomPinyinTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:pinyinTextFieldFontPercentTextFieldHeight*frame.size.height];
        self.placeholder = @"pin yin";
    }
    return self;
}

@end
