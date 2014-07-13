//
//  AuthManager.m
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

#import "AuthManager.h"

#import <AFNetworking.h>
#import <Mantle.h>

@interface AuthManager ()

@property(nonatomic, strong) void (^signInResultHandler)(GmailAccessTokenEntity* accessToken, NSError* error);

@end

@implementation AuthManager


+ (AuthManager*)sharedInstance {
    
    static AuthManager* sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [AuthManager new];
    });
    
    return sharedManager;
}

- (void)signInWithCompletionHandler:(void (^)(GmailAccessTokenEntity* accessToken, NSError* error))completionHandler {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://accounts.google.com/o/oauth2/auth?redirect_uri=me.petrpavlik.MailApp:/oauth2Callback&response_type=code&client_id=442703748995-884gh0tnkjkm0508hriha8f7o8r1ipqr.apps.googleusercontent.com&approval_prompt=force&access_type=offline&scope=https://mail.google.com/"]];
    
    self.signInResultHandler = completionHandler;
}

- (BOOL)openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation {
    
    if ([sourceApplication isEqualToString:@"com.apple.mobilesafari"]) {
        
        if ([url.scheme isEqualToString:@"me.petrpavlik.mailapp"]) {
            
            NSString* code = [url.query stringByReplacingOccurrencesOfString:@"code=" withString:@""];
            
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            
            NSMutableDictionary* params = [NSMutableDictionary new];
            params[@"code"] = code;
            params[@"client_id"] = @"442703748995-884gh0tnkjkm0508hriha8f7o8r1ipqr.apps.googleusercontent.com";
            params[@"client_secret"] = @"";
            params[@"redirect_uri"] = @"me.petrpavlik.MailApp:/oauth2Callback";
            params[@"grant_type"] = @"authorization_code";
            
            [manager POST:@"https://accounts.google.com/o/oauth2/token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSLog(@"JSON: %@", responseObject);
                
                NSError* error;
                GmailAccessTokenEntity *accessToken = [MTLJSONAdapter modelOfClass:GmailAccessTokenEntity.class fromJSONDictionary:responseObject error:&error];
                
                
                self.signInResultHandler(accessToken, error);
                self.signInResultHandler = nil;
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                NSLog(@"Error: %@", error);
                
                self.signInResultHandler(nil, error);
                self.signInResultHandler = nil;
                
            }];
            
            return YES;
        }
    }
    
    return NO;
}

#pragma mark -


+ (void)testLogin {
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://accounts.google.com/o/oauth2/auth" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    /*NSURL *url = [NSURL URLWithString:@"https://accounts.google.com/"];
    GROAuth2SessionManager *sessionManager = [GROAuth2SessionManager managerWithBaseURL:url clientID:@"442703748995-884gh0tnkjkm0508hriha8f7o8r1ipqr.apps.googleusercontent.com" secret:@"_J1YbaoT2kmuW8gby5eA6QnM"];
    
    
    NSDictionary* parameters  = @{@"scope": @"https://mail.google.com/", @"redirect_uri": @"urn:ietf:wg:oauth:2.0:oob", @"response_type": @"code"};
    
    [sessionManager authenticateUsingOAuthWithPath:@"/o/oauth2/auth" parameters:parameters success:^(AFOAuthCredential *credential) {
        
        NSLog(@"I have a token! %@", credential.accessToken);
        [AFOAuthCredential storeCredential:credential withIdentifier:sessionManager.serviceProviderIdentifier];
        
    } failure:^(NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];*/
    
}

@end
