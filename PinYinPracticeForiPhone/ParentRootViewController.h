//
//  ParentRootViewController.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentRootCollectionViewCell.h"

@interface ParentRootViewController : UIViewController < UICollectionViewDataSource, UIScrollViewDelegate >

@property (strong, nonatomic) UICollectionView *categoryCollectionView;
@property (strong, nonatomic) UILabel *viewTitleLabel;
@property (nonatomic, copy) NSArray *catogoriesArray;
@property (nonatomic, assign) NSInteger selectedCellIndex;

@end
