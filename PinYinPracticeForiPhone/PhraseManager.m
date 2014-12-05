//
//  PhraseManager.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/28/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PhraseManager.h"
#import "Phrase.h"
#import "Constants.h"

@interface PhraseManager()
{
    NSMutableArray *allPhrasesArray;
}
@end

@implementation PhraseManager

+ (PhraseManager *)sharedManager
{
    static PhraseManager *sharedManager = nil;
    if (!sharedManager) {
        sharedManager = [[super allocWithZone:nil] init];
    }
    return sharedManager;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedManager];
}

- (id)init
{
    self = [super init];
    if (self) {
        allPhrasesArray = [self fetchPhrasesFromResource];
    }
    return self;
}

- (NSMutableArray *)fetchPhrasesFromResource
{
    NSMutableArray *phrasesArray = [NSMutableArray array];
    
    NSString *listPath = [[NSBundle mainBundle] pathForResource:@"FinalPinYinList" ofType:@"txt"];
    NSArray *listArray = [NSArray array];
    listArray = [listArray initWithContentsOfFile:listPath];
    
    for (int i=0; i<listArray.count-3; i=i+4) {
        Phrase *phrase = [[Phrase alloc] init];

        phrase.tag = [listArray[i] integerValue];
        phrase.pinyinFull = listArray[i+1];
        phrase.pinyinWithoutTones = listArray[i+2];
        
//        phrase.tones = [NSString stringWithFormat:@"%ld", phrase.tag/100];
        NSString *tonesNumber = [NSString stringWithFormat:@"%ld", phrase.tag/100];
        int firstToneNumber = [[tonesNumber substringToIndex:1] intValue];
        int secondToneNumber = [[tonesNumber substringFromIndex:1] intValue];
        NSString *firstTone = [self toneFromToneNumber:firstToneNumber];
        NSString *secondTone = [self toneFromToneNumber:secondToneNumber];
        phrase.tones = [firstTone stringByAppendingString:secondTone];
        
        phrase.characters = listArray[i+3];
        
        NSString *rootFolderName = @"FullPinyin";
        NSString *folderName = [NSString stringWithFormat:@"%ld", phrase.tag/100];
        NSString *fileName = [NSString stringWithFormat:@"%ld", phrase.tag%100+1];
        
        NSString *mp3FilePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@/%@/%@", rootFolderName, folderName, fileName] ofType:@"mp3"];
        phrase.mp3Path = mp3FilePath;
        [phrasesArray addObject:phrase];
    }
    return phrasesArray;
}

- (NSMutableArray *)allPhrasesArray
{
    return allPhrasesArray;
}

- (NSArray *)randomlizedAllPhrases
{
    NSMutableArray *orderedArray = [allPhrasesArray mutableCopy];
    NSUInteger i = [orderedArray count];
    while(--i > 0) {
        int j = rand() % (i+1);
        [orderedArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    return [NSArray arrayWithArray:orderedArray];
}

- (NSArray *)randomPhrasesArrayForTag:(int)tag
{
    NSMutableArray *orderedArray = [self phrasesArrayForTag:tag];
    NSUInteger i = [orderedArray count];
    while(--i > 0) {
        int j = rand() % (i+1);
        [orderedArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    return [NSArray arrayWithArray:orderedArray];
}

- (NSMutableArray *)randomlizedPhrasesOfCountOneHundred
{
    NSMutableArray *randomArray = [NSMutableArray array];
    NSMutableArray *allPhrases = [[self allPhrasesArray] mutableCopy];
    for (int i=0; i<100; i++) {
        int j = rand()%[allPhrases count];
        [randomArray addObject:allPhrasesArray[j]];
        [allPhrases removeObjectAtIndex:j];
    }
    return randomArray;
}

// private methods
- (NSMutableArray *)phrasesArrayForTag:(int)tag
{
    NSMutableArray *phrases = [NSMutableArray array];
    int a = tag/10;
    int b = tag%10;
    for (int i=(a-1)*500+(b-1)*100; i<(a-1)*500+b*100; i++) {
        [phrases addObject:allPhrasesArray[i]];
    }
    return phrases;
}
- (NSString *)toneFromToneNumber:(int)toneNumber
{
    NSString *tone;
    switch (toneNumber) {
        case 1:
            tone = (NSString *)firstToneString;
            break;
        case 2:
            tone = (NSString *)secondToneString;
            break;
        case 3:
            tone = (NSString *)thirdToneString;
            break;
        case 4:
            tone = (NSString *)fourthToneString;
            break;
        case 5:
            tone = (NSString *)lightToneString;
            break;
        default:
            tone = @"";
            break;
    }
    return tone;
}

@end
