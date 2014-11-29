//
//  FirstViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/23/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ListenRootViewController.h"
#import "ListenItemViewController.h"
#import "Constants.h"

@implementation ListenRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catogoriesArray = @[@"Level Tone", @"Rising Tone", @"Falling-rising Tone", @"Falling Tone"];
}

- (void)selectConfirmed:(id)sender
{
    NSUInteger cellIndex = self.selectedCell.tag;
    NSString *actionSheetTitle;
    switch (cellIndex) {
        case 0:
            actionSheetTitle = @"Level Tone With";
            break;
        case 1:
            actionSheetTitle = @"Rising Tone With";
            break;
        case 2:
            actionSheetTitle = @"Falling-rising Tone With";
            break;
        case 3:
            actionSheetTitle = @"Falling Tone With";
            break;
        default:
            actionSheetTitle = @"";
            break;
    }
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"level Tone", @"rising Tone", @"falling-rising tone", @"falling tone", @"neutral tone", nil];
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ListenItemViewController *itemController = [[ListenItemViewController alloc] init];
    
    switch (buttonIndex) {
        case 0:
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 1:

            break;
        case 2:

            break;
        case 3:

            break;
        default:

            break;
    }
}

@end
