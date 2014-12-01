//
//  ListenCollectionViewCell.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/24/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ListenCollectionViewCell.h"
#import "Constants.h"

@implementation ListenCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect contentRect = CGRectMake(0, frame.size.height * 0.1, frame.size.width, frame.size.height * 0.6);
        
        _contentLabel = [[UILabel alloc] initWithFrame:contentRect];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
//        _contentLabel.font = [UIFont systemFontOfSize:listenCellLabelWordsFontPercentWidth * frame.size.width];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        
        CGRect buttonRect = CGRectMake(frame.size.width * 0.15, frame.size.height * 0.75, frame.size.width * 0.7, frame.size.height * 0.12);
        _selectButton = [[UIButton alloc] initWithFrame:buttonRect];
        
        [_selectButton setTitle:@"Press to enter" forState:UIControlStateNormal];
        [_selectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _selectButton.titleLabel.font = [UIFont systemFontOfSize:listenCellButtonFontPercentWidth * frame.size.width];
        
        [_selectButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        _selectButton.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
        [self.contentView addSubview:_selectButton];
        
        UIView *bgView = [[UIView alloc] initWithFrame:frame];
        bgView.layer.borderColor = [UIColor blueColor].CGColor;
        bgView.layer.borderWidth = 1.0;
        self.backgroundView = bgView;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
    }
    return self;
}

@end
