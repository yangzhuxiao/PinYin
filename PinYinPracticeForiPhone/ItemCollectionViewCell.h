//
//  CollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/25/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPlayMp3Button.h"

@interface ItemCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) CustomPlayMp3Button *playButton;
@property (nonatomic, strong) UILabel *wordLabel;

@end
