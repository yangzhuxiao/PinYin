//
//  CustomAutoPlayButton.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/3/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "CustomAutoPlayButton.h"
#import <FontAwesomeKit/FAKIonIcons.h>
#import "Constants.h"
@implementation CustomAutoPlayButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        FAKIonIcons *autoPlayIconNormal = [FAKIonIcons wineglassIconWithSize:0.8*frame.size.width];
        [autoPlayIconNormal addAttribute:NSForegroundColorAttributeName value:txtColor];
        UIImage *autoPlayImageNormal = [autoPlayIconNormal imageWithSize:CGSizeMake(frame.size.width, frame.size.width)];
        [self setImage:autoPlayImageNormal forState:UIControlStateNormal];
        
        NSMutableArray *animatedImages = [NSMutableArray array];
        for (int i=100; i>70; i--) {
            FAKIonIcons *icon = [FAKIonIcons videocameraIconWithSize:(i/100.0)*frame.size.width];
            [icon addAttribute:NSForegroundColorAttributeName value:hightlightedColor];
            UIImage *image = [icon imageWithSize:CGSizeMake(frame.size.width, frame.size.width)];
            [animatedImages addObject:image];
        }
        for (int i=70; i<100; i++) {
            FAKIonIcons *icon = [FAKIonIcons videocameraIconWithSize:(i/100.0)*frame.size.width];
            [icon addAttribute:NSForegroundColorAttributeName value:hightlightedColor];
            UIImage *image = [icon imageWithSize:CGSizeMake(frame.size.width, frame.size.width)];
            [animatedImages addObject:image];
        }
        
        UIImage *backImageSelected = [UIImage animatedImageWithImages:animatedImages duration:ScrollingTimeInterval/2.0];
        [self setImage:backImageSelected forState:UIControlStateSelected];
        self.showsTouchWhenHighlighted = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // To forward the message to the next responder, send the message to super
    [super touchesBegan:touches withEvent:event];
    
    // We only support single touches, so anyObject retrieves just that touch from touches.
    UITouch *touch = [touches anyObject];
    
    // Animate the first touch.
    CGPoint touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchPoint)) {
        [self animateFirstTouchAtPoint:self.center];
    }
}

- (void)animateFirstTouchAtPoint:(CGPoint)touchPoint {
    /*
     This illustrates using UIView's built-in animation.  We want, though, to animate the same property (transform) twice -- first to scale up, then to shrink.  You can't animate the same property more than once using the built-in animation -- the last one wins.  So we'll set a delegate action to be invoked after the first animation has finished.  It will complete the sequence.
     
     The touch point is passed in an NSValue object as the context to beginAnimations:. To make sure the object survives until the delegate method, pass the reference as retained.
     */
    
#define GROW_ANIMATION_DURATION_SECONDS 0.15
#define GROW_FACTOR 1.5f
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

//- (UIImage *)scaleImgae:(UIImage *)image byScalingToSize:(CGSize)targetSize {
//    
//    UIImage *sourceImage = image;
//    UIImage *newImage = nil;
//    
//    //   CGSize imageSize = sourceImage.size;
//    //   CGFloat width = imageSize.width;
//    //   CGFloat height = imageSize.height;
//    
//    CGFloat targetWidth = targetSize.width;
//    CGFloat targetHeight = targetSize.height;
//    
//    //   CGFloat scaleFactor = 0.0;
//    CGFloat scaledWidth = targetWidth;
//    CGFloat scaledHeight = targetHeight;
//    
//    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
//    
//    // this is actually the interesting part:
//    
//    UIGraphicsBeginImageContext(targetSize);
//    
//    CGRect thumbnailRect = CGRectZero;
//    thumbnailRect.origin = thumbnailPoint;
//    thumbnailRect.size.width  = scaledWidth;
//    thumbnailRect.size.height = scaledHeight;
//    
//    [sourceImage drawInRect:thumbnailRect];
//    
//    newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    if(newImage == nil) NSLog(@"could not scale image");
//    
//    
//    return newImage ;
//}
//
//
//- (UIImage *)rotateImage:(UIImage *)image byDegrees:(CGFloat)radians
//{
//    // calculate the size of the rotated view's containing box for our drawing space
//    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,image.size.width,image.size.height)];
//    CGAffineTransform trans = CGAffineTransformMakeRotation(radians);
//    rotatedViewBox.transform = trans;
//    CGSize rotatedSize = rotatedViewBox.frame.size;
//    
//    // Create the bitmap context
//    UIGraphicsBeginImageContext(rotatedSize);
//    CGContextRef bitmap = UIGraphicsGetCurrentContext();
//    
//    // Move the origin to the middle of the image so we will rotate and scale around the center.
//    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
//    
//    //   // Rotate the image context
//    CGContextRotateCTM(bitmap, radians);
//    
//    // Now, draw the rotated/scaled image into the context
//    CGContextScaleCTM(bitmap, 1.0, -1.0);
//    CGContextDrawImage(bitmap, CGRectMake(-image.size.width / 2, -image.size.height / 2, image.size.width, image.size.height), [image CGImage]);
//    
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}
//


@end
