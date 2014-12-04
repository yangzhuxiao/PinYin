//
//  CustomConfirmButton.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/3/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomConfirmButton.h"
#import "Constants.h"

@implementation CustomConfirmButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:@"Done" forState:UIControlStateNormal];
        [self setTitleColor:txtColor forState:UIControlStateDisabled];
        [self setTitleColor:hightlightedColor forState:UIControlStateNormal];

        self.showsTouchWhenHighlighted = YES;
        
        self.titleLabel.font = [UIFont systemFontOfSize:frame.size.height * confirmSelectionButtonFontPercentButtonHeight];
        
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 5.0f;
        self.layer.borderColor = bdColor.CGColor;
    }
    return self;
}

- (void)animateFirstTouchAtPoint:(CGPoint)touchPoint {
    /*
     This illustrates using UIView's built-in animation.  We want, though, to animate the same property (transform) twice -- first to scale up, then to shrink.  You can't animate the same property more than once using the built-in animation -- the last one wins.  So we'll set a delegate action to be invoked after the first animation has finished.  It will complete the sequence.
     
     The touch point is passed in an NSValue object as the context to beginAnimations:. To make sure the object survives until the delegate method, pass the reference as retained.
     */
    
#define GROW_ANIMATION_DURATION_SECONDS 0.15
#define GROW_FACTOR 1.2f
#define SHRINK_FACTOR 1.0f
    
    NSValue *touchPointValue = [NSValue valueWithCGPoint:touchPoint];
    [UIView beginAnimations:nil context:(__bridge_retained void *)touchPointValue];
    [UIView setAnimationDuration:GROW_ANIMATION_DURATION_SECONDS];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(growAnimationDidStop:finished:context:)];
    CGAffineTransform transform = CGAffineTransformMakeScale(GROW_FACTOR, GROW_FACTOR);
    self.transform = transform;
    [UIView commitAnimations];
}

- (void)growAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
#define MOVE_ANIMATION_DURATION_SECONDS 0.15
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:MOVE_ANIMATION_DURATION_SECONDS];
    self.transform = CGAffineTransformMakeScale(SHRINK_FACTOR, SHRINK_FACTOR);
    /*
     Move the placardView to under the touch.
     We passed the location wrapped in an NSValue as the context. Get the point from the value, and transfer ownership to ARC to balance the bridge retain in touchesBegan:withEvent:.
     */
    NSValue *touchPointValue = (__bridge_transfer NSValue *)context;
    self.center = [touchPointValue CGPointValue];
    [UIView commitAnimations];
}




@end
