//
//  AccessTokenEntity.m
//  MailApp
//
//  Created by Petr Pavlik on 12/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

#import "GmailAccessTokenEntity.h"

@implementation GmailAccessTokenEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"accessToken": @"access_token",
             @"expiresIn": @"expires_in",
             @"tokenType": @"token_type",
             @"refreshToken": @"refresh_token"
             };
}

#pragma mark -

+ (NSURLSessionDataTask*)requestAccessTokenWithCode:(NSString*)code completionHandler:(void (^)(GmailAccessTokenEntity* token, NSError* error))completionHandler {
    
    return nil;
}

@end
