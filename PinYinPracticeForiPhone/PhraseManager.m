//
//  PhraseManager.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/28/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PhraseManager.h"

@implementation PhraseManager

+ (NSArray *)allPhrasesArray
{
    NSString *listPath = [[NSBundle mainBundle] pathForResource:@"FinalPinYinList" ofType:@"txt"];
    NSArray *listArray = [NSArray array];
    listArray = [listArray initWithContentsOfFile:listPath];
    return listArray;
}

//+ (NSArray *)phraseArrayWithCharactersAndMp3FilesForFirstTone:(NSInteger)firstTone andSecondTone:(NSInteger)secondTone
//{
//    
//}

@end
