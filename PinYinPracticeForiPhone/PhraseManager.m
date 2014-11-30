//
//  PhraseManager.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/28/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PhraseManager.h"
#import "Phrase.h"

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
        phrase.tones = [NSString stringWithFormat:@"%ld", phrase.tag/100];
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

@end
