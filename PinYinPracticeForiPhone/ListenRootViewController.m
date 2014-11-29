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
    _tag = 0;
    self.viewTitleLabel.text = @"Pick the first tone";
    self.catogoriesArray = @[@"Level Tone", @"Rising Tone", @"Falling-rising Tone", @"Falling Tone"];
}

- (void)selectConfirmed:(id)sender
{
    NSString *actionSheetTitle;
    switch (self.selectedCellIndex) {
        case 0:
            actionSheetTitle = @"Level Tone With";
            _tag = 1;
            break;
        case 1:
            actionSheetTitle = @"Rising Tone With";
            _tag = 2;
            break;
        case 2:
            actionSheetTitle = @"Falling-rising Tone With";
            _tag = 3;
            break;
        case 3:
            actionSheetTitle = @"Falling Tone With";
            _tag = 4;
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
            itemController.tag = _tag*10 + 1;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 1:
            itemController.tag = _tag*10 + 2;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 2:
            itemController.tag = _tag*10 + 3;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 3:
            itemController.tag = _tag*10 + 4;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 4:
            itemController.tag = _tag*10 + 5;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        default:
            _tag = 0;
            break;
    }
}

@end
