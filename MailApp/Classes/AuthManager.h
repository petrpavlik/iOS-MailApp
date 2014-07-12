//
//  AuthManager.h
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthManager : NSObject

+ (AuthManager*)sharedInstance;

//- (void)authenticateWithCompletionHandler

- (BOOL)openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation;

@end
