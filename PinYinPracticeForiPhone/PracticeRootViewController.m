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
    self.catogoriesArray = @[@"Select the right tones according to recording and Pinyin", @"Write down the right Pinyin according to recording and the tones", @"Write down the right Pinyin and tones according to the recording"];
}

- (void)selectConfirmed:(id)sender
{
    id superView1 = [sender superview];
    if ([superView1 isKindOfClass:[ParentRootCollectionViewCell class]]) {
        self.selectedCell = (ParentRootCollectionViewCell *)superView1;
    } else {
        id superView2 = [superView1 superview];
        if ([superView2 isKindOfClass:[ParentRootCollectionViewCell class]]) {
            self.selectedCell = (ParentRootCollectionViewCell *)superView2;
        } else {
            id superView3 = [superView2 superview];
            if ([superView3 isKindOfClass:[ParentRootCollectionViewCell class]]) {
                self.selectedCell = (ParentRootCollectionViewCell *)superView3;
            } else return;
        }
    }
    
    if (self.selectedCell.tag == 0) {
        PracticeOneViewController *oneController = [[PracticeOneViewController alloc] init];
        [self presentViewController:oneController animated:YES completion:nil];
    } else if (self.selectedCell.tag == 1) {
        PracticeTwoViewController *twoController = [[PracticeTwoViewController alloc] init];
        [self presentViewController:twoController animated:YES completion:nil];
    } else if (self.selectedCell.tag == 2) {
        PracticeThreeViewController *threeController = [[PracticeThreeViewController alloc] init];
        [self presentViewController:threeController animated:YES completion:nil];
    }
}

@end






