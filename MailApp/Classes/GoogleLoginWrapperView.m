//
//  GoogleLoginWrapperView.m
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

#import "GoogleLoginWrapperView.h"
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>

@implementation GoogleLoginWrapperView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        GPPSignInButton* signInButton = [[GPPSignInButton alloc] initWithFrame:self.bounds];
        [self addSubview:signInButton];
        
    }
    return self;
}

@end
