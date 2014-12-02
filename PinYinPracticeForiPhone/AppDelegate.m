//
//  AppDelegate.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/23/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "AppDelegate.h"
#import "PhraseManager.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"%@", [UIFont familyNames]);
    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Helvetica"]);

    
    [[PhraseManager sharedManager] allPhrasesArray];
        
// construct plist file

//    NSString *textPath = @"/Users/yangxiaozhu/Desktop/test.txt";
//    NSString *textFileContent = [NSString stringWithContentsOfFile:textPath encoding:NSUTF8StringEncoding error:nil];
//    NSArray *contentArray = [textFileContent componentsSeparatedByString:@"\n"];
//    
//    NSMutableDictionary *temp1 = [NSMutableDictionary dictionary];
//    NSMutableDictionary *temp2 = [NSMutableDictionary dictionary];
//
//    for (int i = 0; i < contentArray.count-3; i=i+4) {
//        [temp1 setValue:contentArray[i+2] forKey:contentArray[i+1]];
//        [temp2 setValue:contentArray[i] forKey:contentArray[i+1]];
//    }
//    
//    NSString *plistFilePath1 = [textPath stringByReplacingOccurrencesOfString:@"test.txt" withString:@"practice11.plist"];
//    NSString *plistFilePath2 = [textPath stringByReplacingOccurrencesOfString:@"test.txt" withString:@"practice12.plist"];
//    [temp1 writeToFile:plistFilePath1 atomically:YES];
//    [temp2 writeToFile:plistFilePath2 atomically:YES];
    
// construct FullList.txt
//    
//    NSString *textPath = @"/Users/yangxiaozhu/Desktop/final.txt";
//    NSString *textFileContent = [NSString stringWithContentsOfFile:textPath encoding:NSUTF8StringEncoding error:nil];
//
//
//    NSArray *contentArray = [textFileContent componentsSeparatedByString:@"\n"];
//    
//    NSMutableArray *newArray = [NSMutableArray array];
//    
//    for (int i = 0; i < contentArray.count-3; i=i+3) {
//        int a = (i/3)/500;
//        int b = (i/3)%500;
//        int c = b/100;
//        int d = b%100;
//        
//        int tag = (a+1)*1000+(c+1)*100+d;
//        NSNumber *tagValue = [NSNumber numberWithInt:tag];
//        [newArray addObject:tagValue];
//        [newArray addObject:contentArray[i]];
//        [newArray addObject:contentArray[i+1]];
//        [newArray addObject:contentArray[i+2]];
//    }
//    
//    NSString *plistFilePath = [textPath stringByReplacingOccurrencesOfString:@"final" withString:@"FinalPinYinList"];
//    [newArray writeToFile:plistFilePath atomically:YES];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
