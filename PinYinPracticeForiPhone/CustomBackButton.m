//
//  CustomBackButton.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/3/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomBackButton.h"
#import <FontAwesomeKit/FAKIonIcons.h>
#import "Constants.h"

@implementation CustomBackButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        FAKIonIcons *backIconNormal = [FAKIonIcons ios7HomeOutlineIconWithSize:frame.size.width];
        [backIconNormal addAttribute:NSForegroundColorAttributeName value:hightlightedColor];
        UIImage *backImageNormal = [backIconNormal imageWithSize:frame.size];
        [self setImage:backImageNormal forState:UIControlStateNormal];        
        self.showsTouchWhenHighlighted = YES;
    }
    return self;
}

@end
