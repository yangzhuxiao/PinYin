//
//  ParentPracticeCollectionViewCell.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPlayMp3Button.h"
#import "CustomConfirmButton.h"
#import "CustomCongratulationLabel.h"
#import "CustomRightAnswerLabel.h"
@interface ParentPracticeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) CustomPlayMp3Button *playButton;
@property (nonatomic, strong) CustomConfirmButton *confirmSelectionButton;
@property (nonatomic, strong) CustomCongratulationLabel *congratulateLabel;
@property (nonatomic, strong) CustomRightAnswerLabel *righAnswerLabel;

@end
