//
//  ContactUsViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/6/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ContactUsViewController.h"
#import "MailManager.h"
#import "Constants.h"

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = bgColor;
    
    _IconButton.layer.cornerRadius = 0.02*self.view.frame.size.width;
    _IconButton.imageView.layer.cornerRadius = 0.02*self.view.frame.size.width;
    _feedBackButton.layer.cornerRadius = 0.03*self.view.frame.size.width;
    _forwardButton.layer.cornerRadius = 0.03*self.view.frame.size.width;
}

- (void)sendFeedbackWithMailView
{
    NSString *toEmailAddress = @"info@chinese-at-ease.com";
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass != nil && [mailClass canSendMail]) {
        [MailManager displayComposerSheetToEmailAddress:toEmailAddress delegate:self];
    } else {
        [MailManager launchMailToEmailAddress:toEmailAddress];
    }
}

- (void)sendAppLocationToFriends
{
    NSString *toEmailAddress = @"";
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass != nil && [mailClass canSendMail]) {
        [MailManager displayComposerSheetToEmailAddress:toEmailAddress delegate:self];
    } else {
        [MailManager launchMailToEmailAddress:toEmailAddress];
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)IconClicked:(id)sender {
//    UIAppl	ication
}

- (IBAction)sendFeedBack:(id)sender {
}

- (IBAction)forwardToFriends:(id)sender {
}
@end
