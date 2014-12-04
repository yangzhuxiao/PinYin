//
//  Constants.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/24/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#ifndef PinYinPracticeForiPhone_Constants_h
#define PinYinPracticeForiPhone_Constants_h

#import <UIKit/UIKit.h>

#define bgColor [UIColor colorWithRed:204/255 green:1 blue:204/255 alpha:0.1]
#define txtColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
#define bdColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
#define hightlightedColor [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1]

// tones

static const NSString *firstToneString =  @"  ˉ  ";
static const NSString *secondToneString = @"  ˊ  ";
static const NSString *thirdToneString =  @"  ˇ  ";
static const NSString *fourthToneString = @"  ˋ  ";
static const NSString *lightToneString =  @"     ";
static const NSInteger toneStringLength = 5;

// View frame size
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

// View TitleLabel size
#define TitleLabelWidth self.view.frame.size.width * 0.9
#define TitleLabelHeight self.view.frame.size.height * 0.1
#define TitleLabelXOffset self.view.frame.size.width * 0.05
#define TitleLabelYOffset self.view.frame.size.width * 0.1
static const CGFloat TitleLabelFontPercentWidth = 0.06;


// CollectionView size
#define CollectionViewWidth self.view.frame.size.width
#define CollectionViewHeight self.view.frame.size.height
#define CollectionViewYUpperOffset 0.0
#define MinimumLineSpacing CollectionViewWidth * 0.15

// CollectionViewCell item size
#define ItemWidth CollectionViewWidth * 0.6
#define ItemHeight CollectionViewHeight * 0.5

// CollectionView sectionInset
#define SectionInsetTop CollectionViewHeight * 0.3
#define SectionInsetLeft CollectionViewWidth * 0.2
#define SectionInsetBottom CollectionViewHeight * 0.2
#define SectionInsetRight CollectionViewWidth * 0.25

// CollectionViewCell content
static const CGFloat listenCellLabelWordsFontPercentWidth = 0.1;
static const CGFloat listenCellButtonFontPercentWidth = 0.07;
static const CGFloat listenCellLabelTonesFontPercentWidth = 0.25;

// ScrollView size
#define ItemColletionViewWidth self.view.frame.size.width
#define ItemColletionViewHeight self.view.frame.size.height

// Scroll-to-zoom animation
#define ACTIVE_DISTANCE 300
#define ZOOM_FACTOR 0.3

// ReplayButton size for Listen
static const CGFloat PlayButtonWidthPercentWidth = 0.12;
static const CGFloat PlayButtonHeightPercentWidth = 0.12;
static const CGFloat PlayButtonXOriginPercent = 0.75;
static const CGFloat PlayButtonYOriginPercent = 0.7;

// BackButton size
static const CGFloat BackButtonWidthPercentWidth = 0.12;
static const CGFloat BackButtonHeightPercentWidth = 0.12;
static const CGFloat BackButtonXOriginPercent = 0.0469;
static const CGFloat BackButtonYOriginPercent = 0.05;

// AutoPlayButton size
static const CGFloat autoPlayButtonWidthPercentWidth = 0.15;
static const CGFloat autoPlayButtonHeightPercentWidth = 0.15;
static const CGFloat autoPlayButtonXOffsetToRightPercent = 0.0469;
static const CGFloat autoPlayButtonYOriginPercent = 0.04;

// CountLabel size
static const CGFloat CountLabelWidthPercent = 0.4;
static const CGFloat CountLabelHeightPercent = 0.1;
static const CGFloat CountLabelXOriginPercent = 0.5;
static const CGFloat CountLabelYOriginPercent = 0.05;
static const CGFloat CountLabelFontPercentWidth = 0.05;

// IndexLabel size
static const CGFloat IndexLabelWidthPercent = 0.2;
static const CGFloat IndexLabelHeightPercent = 0.05;
static const CGFloat IndexLabelXOriginPercent = 0.4;
static const CGFloat IndexLabelYOriginPercent = 0.93;

static const CGFloat IndexLabelFontPercentWidth = 0.05;

// WordLabel size for Listen
static const CGFloat WordLabelWidthPercent = 0.95;
static const CGFloat WordLabelHeightPercent = 0.6;
static const CGFloat WordLabelXOriginPercent = 0.025;
static const CGFloat WordLabelYOriginPercent = 0.15;
static const CGFloat WordLabelFontPercentWidth = 0.17;

// PinYinLabel size for Practice One
static const CGFloat PinYinLabelFontPercentLabelHeight = 0.75;
static const CGFloat PinYinLabelWidthPercentWidth = 0.45;
static const CGFloat PinYinLabelHeightPercentWidth = 0.20;
// PinYinLabel One Offset
static const CGFloat PinYinLabelOneXOriginPercentWidth = 0.025;
static const CGFloat PinYinLabelOneYOriginPercentHeight = 0.2;
// PinYinLabel Two Offset
static const CGFloat PinYinLabelTwoXOriginPercentWidth = 0.525;
static const CGFloat PinYinLabelTwoYOriginPercentHeight = 0.2;

// SelectToneIndicatorLabel
static const CGFloat SelectToneIndicatorLabelOneWidthPercent = 0.8;
static const CGFloat SelectToneIndicatorLabelOneHeightPercent = 0.06;
static const CGFloat SelectToneIndicatorLabelOneXOriginPercent = 0.12;
static const CGFloat SelectToneIndicatorLabelOneYOriginPercent = 0.35;
static const CGFloat SelectToneIndicatorLabelOneFontPercentWidth = 0.04;

static const CGFloat SelectToneIndicatorLabelTwoWidthPercent = 0.8;
static const CGFloat SelectToneIndicatorLabelTwoHeightPercent = 0.06;
static const CGFloat SelectToneIndicatorLabelTwoXOriginPercent = 0.12;
static const CGFloat SelectToneIndicatorLabelTwoYOriginPercent = 0.5;
static const CGFloat SelectToneIndicatorLabelTwoFontPercentWidth = 0.04;

// ToneButton basic size for Practice One
static const CGFloat ToneButtonXSpaceWidthPercent = 0.16;
static const CGFloat ToneButtonYSpaceHeightPercent = 0.15;

static const CGFloat ToneButtonBasicWidthPercent = 0.15;
static const CGFloat ToneButtonBasicHeightPercent = 0.06;
static const CGFloat ToneButtonBasicXOriginPercent = 0.12;
static const CGFloat ToneButtonBasicYOriginPercent = 0.42;
static const CGFloat ToneButtonBasicFontPercentWidth = 0.2;

// confirmSelectionButton
static const CGFloat confirmSelectionButtonWidthPercentWidth = 0.2;
static const CGFloat confirmSelectionButtonHeightPercentWidth = 0.1;
static const CGFloat confirmSelectionButtonXOriginPercent = 0.12;
static const CGFloat confirmSelectionButtonYOriginPercent = 0.70;
static const CGFloat confirmSelectionButtonFontPercentButtonHeight = 0.7;

// congratulateLabel
static const CGFloat congratulateLabelWidthPercent = 0.8;
static const CGFloat congratulateLabelHeightPercent = 0.1;
static const CGFloat congratulateLabelXOriginPercent = 0.12;
static const CGFloat congratulateLabelYOriginPercent = 0.80;
static const CGFloat congratulateLabelFontPercentWidth = 0.08;

// righAnswerLabel
static const CGFloat righAnswerLabelWidthPercent = 0.8;
static const CGFloat righAnswerLabelHeightPercent = 0.12;
static const CGFloat righAnswerLabelXOriginPercent = 0.12;
static const CGFloat righAnswerLabelYOriginPercent = 0.80;
static const CGFloat righAnswerLabelFontPercentWidth = 0.05;



// PickerView size for Practice One
static const CGFloat PickerWidthPercent = 1.0;
static const CGFloat PickerHeightPercent = 0.3;
static const CGFloat PickerXOriginPercent = 0;
static const CGFloat PickerYOriginPercent = 0.2;

// Auto-scrolling timeInterval
static const NSTimeInterval ScrollingTimeInterval = 2.5;


#pragma mark - Practice Two

#pragma mark -  PinYin TextField
// pinyinTextField Size
static const CGFloat pinyinTextFieldFontPercentTextFieldHeight = 0.6;
static const CGFloat pinyinTextFieldPlaceHolderFontPercentWidth = 0.03;
static const CGFloat pinyinTextFieldWidthPercentWidth = 0.4;
static const CGFloat pinyinTextFieldHeightPercentWidth = 0.2;
// pinyinOneTextField Offset
static const CGFloat pinyinOneTextFieldForPrac2XOriginPercent = 0.08;
static const CGFloat pinyinOneTextFieldForPrac2YOriginPercent = 0.40;
// pinyinTwoTextField Offset
static const CGFloat pinyinTwoTextFieldForPrac2XOriginPercent = 0.52;
static const CGFloat pinyinTwoTextFieldForPrac2YOriginPercent = 0.40;
// pinyinOneTextFieldForPrac3 size
static const CGFloat pinyinOneTextFieldForPrac3XOriginPercent = 0.12;
static const CGFloat pinyinOneTextFieldForPrac3YOriginPercent = 0.20;
// pinyinTwoTextFieldForPrac3 size
static const CGFloat pinyinTwoTextFieldForPrac3XOriginPercent = 0.53;
static const CGFloat pinyinTwoTextFieldForPrac3YOriginPercent = 0.20;

// toneLabelOne size
static const CGFloat ToneLabelFontPercentLabelHeight = 0.7;
static const CGFloat ToneLabelWidthPercentWidth = 0.45;
static const CGFloat ToneLabelHeightPercentWidth = 0.3;

// toneLabelOne For Practice 1 offset
static const CGFloat ToneLabelOneForPrac1XOriginPercentWidth = 0.025;
static const CGFloat ToneLabelOneForPrac1YOriginPercentHeight = 0.15;
// toneLabelTwo For Practice 1 offset
static const CGFloat ToneLabelTwoForPrac1XOriginPercentWidth = 0.525;
static const CGFloat ToneLabelTwoForPrac1YOriginPercentHeight = 0.15;

// toneLabelOne For Practice 2 offset
static const CGFloat ToneLabelOneForPrac2XOriginPercentWidth = 0.08;
static const CGFloat ToneLabelOneForPrac2YOriginPercentHeight = 0.3;
// toneLabelTwo For Practice 2 offset
static const CGFloat ToneLabelTwoForPrac2XOriginPercentWidth = 0.52;
static const CGFloat ToneLabelTwoForPrac2YOriginPercentHeight = 0.3;

// toneLabelOne For Practice 3 offset
static const CGFloat ToneLabelOneForPrac3XOriginPercentWidth = 0.08;
static const CGFloat ToneLabelOneForPrac3YOriginPercentHeight = 0.10;
// toneLabelTwo For Practice 3 offset
static const CGFloat ToneLabelTwoForPrac3XOriginPercentWidth = 0.52;
static const CGFloat ToneLabelTwoForPrac3YOriginPercentHeight = 0.10;

#endif
