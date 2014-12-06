//
//  ContactUsTableViewController.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 12/6/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactUsViewController : UIViewController < UITableViewDataSource, UITabBarDelegate, MFMailComposeViewControllerDelegate >
@property (strong, nonatomic) IBOutlet UIButton *IconButton;
@property (strong, nonatomic) IBOutlet UIButton *feedBackButton;
@property (strong, nonatomic) IBOutlet UIButton *forwardButton;

- (IBAction)IconClicked:(id)sender;
- (IBAction)sendFeedBack:(id)sender;
- (IBAction)forwardToFriends:(id)sender;




@end
