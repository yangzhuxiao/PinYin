//
//  PracticeOneViewController.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/26/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentPracticeViewController.h"
@class PracticeOneCollectionViewCell;

@interface PracticeOneViewController : ParentPracticeViewController < UICollectionViewDelegate, UICollectionViewDataSource >

@property (nonatomic, strong) PracticeOneCollectionViewCell *selectedCell;

@end
