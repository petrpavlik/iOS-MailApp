//
//  AuthManager.m
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

#import "AuthManager.h"

#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <AFNetworking.h>

@interface AuthManager () <GPPSignInDelegate>

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

- (void)configureWithClientId:(NSString*)clientId {
    
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    
    signIn.clientID = clientId;
    signIn.scopes = @[ kGTLAuthScopePlusLogin, @"https://mail.google.com/" ];
    signIn.delegate = self;

}

- (BOOL)openURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation {
    
    return [GPPURLHandler handleURL:url sourceApplication:sourceApplication annotation:annotation];
}

#pragma mark -

- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth
                   error:(NSError *)error {
    
    NSLog(@"%@ %@", auth, error);
}


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
