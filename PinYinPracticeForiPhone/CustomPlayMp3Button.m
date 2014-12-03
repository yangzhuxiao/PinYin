//
//  CustomPlayMp3Button.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/3/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomPlayMp3Button.h"
#import <FontAwesomeKit/FAKIonIcons.h>
#import "Constants.h"

@implementation CustomPlayMp3Button

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 3.0f;
        self.layer.borderColor = bdColor.CGColor;
        
        // Normal state
        FAKIcon *playIconNormal = [FAKIonIcons volumeMediumIconWithSize:0.8*frame.size.width];
        [playIconNormal addAttribute:NSForegroundColorAttributeName value:txtColor];
        UIImage *playImageNormal = [playIconNormal imageWithSize:frame.size];
        [self setImage:playImageNormal forState:UIControlStateNormal];

        // selected state
            //animation images
        FAKIcon *selectedOne = [FAKIonIcons volumeLowIconWithSize:0.8*frame.size.width];
        [selectedOne addAttribute:NSForegroundColorAttributeName value:hightlightedColor];
        UIImage *selectedImageOne = [selectedOne imageWithSize:frame.size];
        
        FAKIcon *selectedTwo = [FAKIonIcons volumeMediumIconWithSize:0.8*frame.size.width];
        [selectedTwo addAttribute:NSForegroundColorAttributeName value:hightlightedColor];
        UIImage *selectedImageTwo = [selectedTwo imageWithSize:frame.size];
        
        FAKIcon *selectedThree = [FAKIonIcons volumeHighIconWithSize:0.8*frame.size.width];
        [selectedThree addAttribute:NSForegroundColorAttributeName value:hightlightedColor];
        UIImage *selectedImageThree = [selectedThree imageWithSize:frame.size];

        UIImage *selectedImage = [UIImage animatedImageWithImages:[NSArray arrayWithObjects:selectedImageOne, selectedImageTwo, selectedImageThree, nil] duration:ScrollingTimeInterval/2.0];
        
        [self setImage:selectedImage forState:UIControlStateSelected];
        
        self.showsTouchWhenHighlighted = YES;
    }
    return self;
}

@end
