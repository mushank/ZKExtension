//
//  NSString+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZKExtension)

// Convert to date
- (NSDate *)zk_dateFromFormatter:(NSString *)formatter;

// Remove whitespace
- (NSString *)zk_removeWhiteSpaceCharacter;

// Return encoded URL string
- (NSString*)zk_encodeURLString;

// Return phonetic symbol (PinYin) from Chinese characters
- (NSString *)zk_toChinesePhoneticSymbol;

- (BOOL)zk_isBeginWithString:(NSString *)begin;
- (BOOL)zk_isEndWithString:(NSString *)end;

- (BOOL)zk_isPureIntString;
- (BOOL)zk_isPureFloatString;

@end
