//
//  AccessTokenEntity.h
//  MailApp
//
//  Created by Petr Pavlik on 12/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface GmailAccessTokenEntity : MTLModel <MTLJSONSerializing>

@property(nonatomic, strong) NSString* accessToken;
@property(nonatomic, strong) NSString* tokenType;
@property(nonatomic, strong) NSString* refreshToken;
@property(nonatomic, strong) NSNumber* expiresIn;

+ (NSURLSessionDataTask*)requestAccessTokenWithCode:(NSString*)code completionHandler:(void (^)(GmailAccessTokenEntity* token, NSError* error))completionHandler;

@end
