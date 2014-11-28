//
//  Phrase.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/28/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phrase : NSObject

@property (nonatomic, copy) NSString *pinyinFull;
@property (nonatomic, copy) NSString *pinyinWithoutTones;
@property (nonatomic, copy) NSString *tones;
@property (nonatomic, copy) NSString *characters;
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, copy) NSString *mp3Path;

@end
