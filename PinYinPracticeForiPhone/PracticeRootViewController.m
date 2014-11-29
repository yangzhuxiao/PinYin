//
//  SecondViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/23/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ParentRootViewController.h"
#import "PracticeRootViewController.h"
#import "PracticeOneViewController.h"
#import "PracticeTwoViewController.h"
#import "PracticeThreeViewController.h"

@implementation PracticeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewTitleLabel.text = @"Pick the test";
    self.catogoriesArray = @[@"Select the right tones according to recording and Pinyin", @"Write down the right Pinyin according to recording and the tones", @"Write down the right Pinyin and tones according to the recording"];
}

- (void)selectConfirmed:(id)sender
{
    if (self.selectedCellIndex == 0) {
        PracticeOneViewController *oneController = [[PracticeOneViewController alloc] init];
        [self presentViewController:oneController animated:YES completion:nil];
    } else if (self.selectedCellIndex == 1) {
        PracticeTwoViewController *twoController = [[PracticeTwoViewController alloc] init];
        [self presentViewController:twoController animated:YES completion:nil];
    } else if (self.selectedCellIndex == 2) {
        PracticeThreeViewController *threeController = [[PracticeThreeViewController alloc] init];
        [self presentViewController:threeController animated:YES completion:nil];
    }
}

@end






