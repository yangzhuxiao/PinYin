//
//  MailManager.m
//  JieShuQuan
//
//  Created by Jianning Zheng on 9/19/14.
//  Copyright (c) 2014 JNXZ. All rights reserved.
//

#import "MailManager.h"
#import <MessageUI/MessageUI.h>

static const NSString *kFeedbackSubject = @"意见反馈";

@implementation MailManager

+ (void)displayComposerSheetToEmailAddress:(NSString *)emailAddress delegate:(id)delegate
{
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
    mailViewController.mailComposeDelegate = delegate;
    [mailViewController setSubject:(NSString *)kFeedbackSubject];
    [mailViewController setToRecipients:@[emailAddress]];
    
    [delegate presentViewController:mailViewController animated:YES completion:nil];
}

+ (void)launchMailToEmailAddress:(NSString *)emailAddress
{
    NSString *recipients = [NSString stringWithFormat:@"mailto:%@&subject=%@", emailAddress, (NSString *)kFeedbackSubject];
    NSString *emailContent = [NSString stringWithFormat:@"%@%@", recipients, @""];
    emailContent = [emailContent stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:emailContent]];
}
@end
