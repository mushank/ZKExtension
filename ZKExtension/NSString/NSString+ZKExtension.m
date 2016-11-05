//
//  NSString+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "NSString+ZKExtension.h"

@implementation NSString (ZKExtension)

- (NSDate *)zk_dateFromFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter dateFromString:self];
}

- (NSString *)zk_removeWhiteSpaceCharacter {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)zk_encodeURLString {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (BOOL)zk_isBeginWithString:(NSString *)begin {
    BOOL result = NO;
    NSRange found = [self rangeOfString:begin options:NSCaseInsensitiveSearch];
    if (found.location == 0) {
        result = YES;
    }
    return result;
}

- (BOOL)zk_isEndWithString:(NSString *)end {
    BOOL result = NO;
    NSRange found = [self rangeOfString:end options:NSCaseInsensitiveSearch];
    if (found.location + found.length == self.length) {
        result = YES;
    }
    return result;
}


@end
