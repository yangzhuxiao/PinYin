//
//  PhraseManager.h
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/28/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhraseManager : NSObject

+ (PhraseManager *)sharedManager;

- (NSMutableArray *)allPhrasesArray;
- (NSArray *)randomlizedAllPhrases;
- (NSArray *)randomPhrasesArrayForTag:(int)tag;
- (NSMutableArray *)randomlizedPhrasesOfCountOneHundred;

@end
