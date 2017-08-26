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

- (NSString *)zk_toChinesePhoneticSymbol
{
    NSMutableString *string = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformStripCombiningMarks, NO);
    return string;
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
    NSRange found = [self rangeOfString:end options:NSCaseInsensitiveSearch | NSBackwardsSearch];
    if (found.location + found.length == self.length) {
        result = YES;
    }
    return result;
}

- (BOOL)zk_isPureIntString{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int value;
    return [scan scanInt:&value] && [scan isAtEnd];
}

- (BOOL)zk_isPureFloatString{
    NSScanner *scan = [NSScanner scannerWithString:self];
    float value;
    return [scan scanFloat:&value] && [scan isAtEnd];
}

@end
