//
//  PhraseManager.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/28/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhraseManager : NSObject

+ (NSArray *)allPhrasesArray;

+ (NSArray *)arrayWithCharactersAndMp3FilesForFirstTone:(NSInteger)firstTone andSecondTone:(NSInteger)secondTone;

@end
