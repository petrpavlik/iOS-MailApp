//
//  GmailThreadMetadata.h
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GmailThreadMetadata : NSObject

@property(nonatomic, strong) NSString* threadId;
@property(nonatomic, strong) NSString* historyId;

@end
