//
//  PracticeTwoViewController.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentPracticeViewController.h"
@class PracticeTwoCollectionViewCell;

@interface PracticeTwoViewController : ParentPracticeViewController < UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) PracticeTwoCollectionViewCell *selectedCell;

@end
