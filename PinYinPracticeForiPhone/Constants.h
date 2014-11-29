//
//  Constants.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/24/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#ifndef PinYinPracticeForiPhone_Constants_h
#define PinYinPracticeForiPhone_Constants_h

// View frame size
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

// View TitleLabel size
#define TitleLabelWidth self.view.frame.size.width * 0.8
#define TitleLabelHeight self.view.frame.size.height * 0.15
#define TitleLabelXOffset self.view.frame.size.width * 0.1
#define TitleLabelYOffset self.view.frame.size.width * 0.15
static const CGFloat TitleLabelFontPercentWidth = 0.08;


// CollectionView size
#define CollectionViewWidth self.view.frame.size.width
#define CollectionViewHeight self.view.frame.size.height
#define CollectionViewYUpperOffset 0.0
#define MinimumLineSpacing CollectionViewWidth * 0.2

// CollectionViewCell item size
#define ItemWidth CollectionViewWidth * 0.5
#define ItemHeight CollectionViewHeight * 0.45

// CollectionView sectionInset
#define SectionInsetTop CollectionViewHeight * 0.4
#define SectionInsetLeft CollectionViewWidth * 0.25
#define SectionInsetBottom CollectionViewHeight * 0.2
#define SectionInsetRight CollectionViewWidth * 0.25

// CollectionViewCell content
static const CGFloat listenCellLabelFontPercentWidth = 0.12;
static const CGFloat listenCellButtonFontPercentWidth = 0.10;

// ScrollView size
#define ItemColletionViewWidth self.view.frame.size.width
#define ItemColletionViewHeight self.view.frame.size.height

// Scroll-to-zoom animation
#define ACTIVE_DISTANCE 300
#define ZOOM_FACTOR 0.3

// ReplayButton size for Listen
static const CGFloat PlayButtonWidthPercent = 0.25;
static const CGFloat PlayButtonHeightPercent = 0.08;
static const CGFloat PlayButtonXOriginPercent = 0.6;
static const CGFloat PlayButtonYOriginPercent = 0.7;
static const CGFloat PlayButtonFontPercentWidth = 0.07;

// BackButton size
static const CGFloat BackButtonWidthPercent = 0.25;
static const CGFloat BackButtonHeightPercent = 0.08;
static const CGFloat BackButtonXOriginPercent = 0.0469;
static const CGFloat BackButtonYOriginPercent = 0.0528;
static const CGFloat BackButtonFontPercentWidth = 0.05;

// AutoPlayButton size
static const CGFloat autoPlayButtonWidthPercent = 0.25;
static const CGFloat autoPlayButtonHeightPercent = 0.08;
static const CGFloat autoPlayButtonXOffsetToRightPercent = 0.0469;
static const CGFloat autoPlayButtonYOriginPercent = 0.0528;
static const CGFloat autoPlayButtonFontPercentWidth = 0.05;

// CountLabel size
static const CGFloat CountLabelWidthPercent = 0.5;
static const CGFloat CountLabelHeightPercent = 0.05;
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
static const CGFloat WordLabelWidthPercent = 0.8;
static const CGFloat WordLabelHeightPercent = 0.1;
static const CGFloat WordLabelXOriginPercent = 0.1;
static const CGFloat WordLabelYOriginPercent = 0.45;
static const CGFloat WordLabelFontPercentWidth = 0.15;

// WordLabel size for Practice One
static const CGFloat PinYinLabelOneWidthPercent = 0.35;
static const CGFloat PinYinLabelOneHeightPercent = 0.1;
static const CGFloat PinYinLabelOneXOriginPercent = 0.12;
static const CGFloat PinYinLabelOneYOriginPercent = 0.20;
static const CGFloat PinYinLabelOneFontPercentWidth = 0.12;

static const CGFloat PinYinLabelTwoWidthPercent = 0.35;
static const CGFloat PinYinLabelTwoHeightPercent = 0.1;
static const CGFloat PinYinLabelTwoXOriginPercent = 0.53;
static const CGFloat PinYinLabelTwoYOriginPercent = 0.20;
static const CGFloat PinYinLabelTwoFontPercentWidth = 0.12;

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
static const CGFloat ToneButtonBasicFontPercentWidth = 0.05;

// confirmSelectionButton
static const CGFloat confirmSelectionButtonWidthPercent = 0.4;
static const CGFloat confirmSelectionButtonHeightPercent = 0.06;
static const CGFloat confirmSelectionButtonXOriginPercent = 0.12;
static const CGFloat confirmSelectionButtonYOriginPercent = 0.70;
static const CGFloat confirmSelectionButtonFontPercentWidth = 0.08;

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
static const CGFloat righAnswerLabelFontPercentWidth = 0.06;

// ReplayButton size for Listen
static const CGFloat PlayButtonForPracOneWidthPercent = 0.20;
static const CGFloat PlayButtonForPracOneHeightPercent = 0.05;
static const CGFloat PlayButtonForPracOneXOriginPercent = 0.7;
static const CGFloat PlayButtonForPracOneYOriginPercent = 0.13;
static const CGFloat PlayButtonForPracOneFontPercentWidth = 0.05;

// PickerView size for Practice One
static const CGFloat PickerWidthPercent = 1.0;
static const CGFloat PickerHeightPercent = 0.3;
static const CGFloat PickerXOriginPercent = 0;
static const CGFloat PickerYOriginPercent = 0.2;

// Auto-scrolling timeInterval
static const NSTimeInterval ScrollingTimeInterval = 2;


#pragma mark - Practice Two

// pinyinOneTextField size
static const CGFloat pinyinOneTextFieldWidthPercent = 0.35;
static const CGFloat pinyinOneTextFieldHeightPercent = 0.1;
static const CGFloat pinyinOneTextFieldXOriginPercent = 0.12;
static const CGFloat pinyinOneTextFieldYOriginPercent = 0.40;

// pinyinTwoTextField size
static const CGFloat pinyinTwoTextFieldWidthPercent = 0.35;
static const CGFloat pinyinTwoTextFieldHeightPercent = 0.1;
static const CGFloat pinyinTwoTextFieldXOriginPercent = 0.53;
static const CGFloat pinyinTwoTextFieldYOriginPercent = 0.40;

// toneLabelOne size
static const CGFloat ToneLabelOneWidthPercent = 0.1;
static const CGFloat ToneLabelOneHeightPercent = 0.05;
static const CGFloat ToneLabelOneXOriginPercent = 0.245;
static const CGFloat ToneLabelOneYOriginPercent = 0.35;
static const CGFloat ToneLabelOneFontPercentWidth = 0.12;

static const CGFloat ToneLabelTwoWidthPercent = 0.1;
static const CGFloat ToneLabelTwoHeightPercent = 0.05;
static const CGFloat ToneLabelTwoXOriginPercent = 0.65;
static const CGFloat ToneLabelTwoYOriginPercent = 0.35;
static const CGFloat ToneLabelTwoFontPercentWidth = 0.12;

#pragma mark - Practice Three

// pinyinOneTextFieldForPrac3 size
static const CGFloat pinyinOneTextFieldForPrac3WidthPercent = 0.35;
static const CGFloat pinyinOneTextFieldForPrac3HeightPercent = 0.1;
static const CGFloat pinyinOneTextFieldForPrac3XOriginPercent = 0.12;
static const CGFloat pinyinOneTextFieldForPrac3YOriginPercent = 0.20;

// pinyinTwoTextFieldForPrac3 size
static const CGFloat pinyinTwoTextFieldForPrac3WidthPercent = 0.35;
static const CGFloat pinyinTwoTextFieldForPrac3HeightPercent = 0.1;
static const CGFloat pinyinTwoTextFieldForPrac3XOriginPercent = 0.53;
static const CGFloat pinyinTwoTextFieldForPrac3YOriginPercent = 0.20;


#endif








