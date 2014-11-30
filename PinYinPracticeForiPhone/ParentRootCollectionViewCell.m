//
//  ParentRootCollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ParentRootCollectionViewCell.h"
#import "Constants.h"

@implementation ParentRootCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect contentRect = CGRectMake(0, frame.size.height * 0.1, frame.size.width, frame.size.height * 0.6);
        
        _contentLabel = [[UILabel alloc] initWithFrame:contentRect];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.font = [UIFont systemFontOfSize:listenCellLabelFontPercentWidth * frame.size.width];
        _contentLabel.numberOfLines = 0;
        [_contentLabel setTextColor:txtColor];
        [self.contentView addSubview:_contentLabel];
        
        CGRect buttonRect = CGRectMake(frame.size.width * 0.1, frame.size.height * 0.75, frame.size.width * 0.8, frame.size.height * 0.15);
        _selectButton = [[UIButton alloc] initWithFrame:buttonRect];
        _selectButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _selectButton.titleLabel.numberOfLines = 0;
        
        [_selectButton setTitle:@"Pick the tone of \nthe second charater" forState:UIControlStateNormal];
        [_selectButton setTitleColor:txtColor forState:UIControlStateNormal];
        _selectButton.titleLabel.font = [UIFont systemFontOfSize:listenCellButtonFontPercentWidth * frame.size.width];
        _selectButton.backgroundColor = [UIColor whiteColor];
        
        [_selectButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        _selectButton.layer.cornerRadius = 5.0;
        [self.contentView addSubview:_selectButton];
        
        UIView *bgView = [[UIView alloc] initWithFrame:frame];

        self.backgroundView = bgView;
        self.backgroundColor = [UIColor colorWithRed:204/255 green:204/255 blue:1 alpha:0.2];
    }
    return self;
}

@end
