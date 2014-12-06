//
//  MailManager.h
//  JieShuQuan
//
//  Created by Jianning Zheng on 9/19/14.
//  Copyright (c) 2014 JNXZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MailManager : NSObject

+ (void)displayComposerSheetToEmailAddress:(NSString *)emailAddress delegate:(id)delegate;
+ (void)launchMailToEmailAddress:(NSString *)emailAddress;

@end
