//
//  CustomCongratulationLabel.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/7/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomCongratulationLabel.h"
#import "Constants.h"
#import <FontAwesomeKit/FAKIonIcons.h>

@implementation CustomCongratulationLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        FAKIonIcons *smileIcon = [FAKIonIcons happyIconWithSize:1.2*frame.size.height * congratulateLabelFontPercentLabelHeight];
        smileIcon.drawingPositionAdjustment = UIOffsetMake(0, 0.2*frame.size.height * congratulateLabelFontPercentLabelHeight);
        [smileIcon addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]];
        UIImage *smileImage = [smileIcon imageWithSize:CGSizeMake(1.2*frame.size.height * congratulateLabelFontPercentLabelHeight, 1.5*frame.size.height * congratulateLabelFontPercentLabelHeight)];
        
        NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
        imageAttachment.image = smileImage;
        
        NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
        NSMutableAttributedString *labelString = [[NSMutableAttributedString alloc] initWithString:@"Cngratulations!"];
        [labelString insertAttributedString:imageString atIndex:1];
        
        [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:frame.size.height * congratulateLabelFontPercentLabelHeight], NSForegroundColorAttributeName: hightlightedColor} range:NSMakeRange(0, 1)];
        
//        [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:frame.size.height * congratulateLabelFontPercentLabelHeight], NSForegroundColorAttributeName: [UIColor redColor]} range:NSMakeRange(1, 1)];
        
        [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:frame.size.height * congratulateLabelFontPercentLabelHeight], NSForegroundColorAttributeName: hightlightedColor} range:NSMakeRange(2, labelString.length-2)];

        self.attributedText = labelString;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end
