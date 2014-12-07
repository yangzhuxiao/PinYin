//
//  CustomCorrectToWrongLabel.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/7/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomCorrectToWrongLabel.h"
#import "Constants.h"
#import <FontAwesomeKit/FAKIonIcons.h>

@implementation CustomCorrectToWrongLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
        self.numberOfLines = 0;
    }
    return self;
}

- (void)setText:(NSString *)text
{
    NSMutableAttributedString *labelString = [[NSMutableAttributedString alloc] initWithString:text];
    
    // sadImageString
    FAKIonIcons *sadIcon = [FAKIonIcons sadIconWithSize:0.9*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight];
    sadIcon.drawingPositionAdjustment = UIOffsetMake(0, 0.1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight);
    [sadIcon addAttribute:NSForegroundColorAttributeName value:hightlightedColor];
    UIImage *sadImage = [sadIcon imageWithSize:CGSizeMake(1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight, 1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight)];
    NSTextAttachment *sadImageAttachment = [[NSTextAttachment alloc] init];
    sadImageAttachment.image = sadImage;
    NSAttributedString *sadImageString = [NSAttributedString attributedStringWithAttachment:sadImageAttachment];
    
    // smileImageString
    FAKIonIcons *smileIcon = [FAKIonIcons happyIconWithSize:0.9*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight];
    smileIcon.drawingPositionAdjustment = UIOffsetMake(0, 0.1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight);
    [smileIcon addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]];
    UIImage *smileImage = [smileIcon imageWithSize:CGSizeMake(1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight, 1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight)];
    NSTextAttachment *smileImageAttachment = [[NSTextAttachment alloc] init];
    smileImageAttachment.image = smileImage;
    NSAttributedString *smileImageString = [NSAttributedString attributedStringWithAttachment:smileImageAttachment];
    
    // colonString
    NSAttributedString *colonString = [[NSAttributedString alloc] initWithString:@":"];
    // returnString
    NSAttributedString *returnString = [[NSAttributedString alloc] initWithString:@"\n"];

    [labelString insertAttributedString:smileImageString atIndex:0];
    [labelString insertAttributedString:colonString atIndex:1];
    [labelString insertAttributedString:sadImageString atIndex:2];
    [labelString insertAttributedString:returnString atIndex:3];
    
    [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight], NSForegroundColorAttributeName: [UIColor redColor]} range:NSMakeRange(4, 1)];
    [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight], NSForegroundColorAttributeName: [UIColor blackColor]} range:NSMakeRange(5, 1)];

    [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:1*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight], NSForegroundColorAttributeName: hightlightedColor} range:NSMakeRange(6, 1)];

    self.attributedText = labelString;
}


@end
