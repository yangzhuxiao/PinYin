//
//  CustomRighAnswerLabel.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/7/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomRightAnswerLabel.h"
#import "Constants.h"
#import <FontAwesomeKit/FAKIonIcons.h>

@implementation CustomRightAnswerLabel

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
    NSString *prefix = @"Srry! The answer is \n";
    NSString *fullStringWithoutPicture = [NSString stringWithFormat:@"%@\"%@\"",prefix, text];
    NSMutableAttributedString *labelString = [[NSMutableAttributedString alloc] initWithString:fullStringWithoutPicture];

    FAKIonIcons *sadIcon = [FAKIonIcons sadIconWithSize:1.2*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight];
    sadIcon.drawingPositionAdjustment = UIOffsetMake(0, 0.2*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight);
    [sadIcon addAttribute:NSForegroundColorAttributeName value:hightlightedColor];
    UIImage *smileImage = [sadIcon imageWithSize:CGSizeMake(1.2*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight, 1.5*self.frame.size.height * rightAnswerLabelFontPercentLabelHeight)];
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = smileImage;
    NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
    
    [labelString insertAttributedString:imageString atIndex:1];
    
    [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:self.frame.size.height * rightAnswerLabelFontPercentLabelHeight], NSForegroundColorAttributeName: [UIColor redColor]} range:NSMakeRange(0, 1)];
    
    //        [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:frame.size.height * congratulateLabelFontPercentLabelHeight], NSForegroundColorAttributeName: [UIColor redColor]} range:NSMakeRange(1, 1)];
    
    [labelString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:self.frame.size.height * rightAnswerLabelFontPercentLabelHeight], NSForegroundColorAttributeName: [UIColor redColor]} range:NSMakeRange(2, labelString.length-2)];
    
    self.attributedText = labelString;
}

@end
