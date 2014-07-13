//
//  AuthManager.h
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GmailAccessTokenEntity.h"

@interface AuthManager : NSObject

+ (AuthManager*)sharedInstance;

//- (void)authenticateWithCompletionHandler

- (void)signInWithCompletionHandler:(void (^)(GmailAccessTokenEntity* accessToken, NSError* error))completionHandler;

- (BOOL)openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation;

@end
