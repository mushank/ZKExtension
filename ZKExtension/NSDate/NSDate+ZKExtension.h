//
//  NSDate+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZKExtension)

// Convert to string
- (NSString *)zk_stringInFormatter:(NSString *)formatter;

- (NSString *)zk_humanReadableTimeString;

#pragma mark - Extension for calendar
- (NSInteger)zk_year;
- (NSInteger)zk_month;
- (NSInteger)zk_day;
- (NSInteger)zk_hour;
- (NSInteger)zk_minute;
- (NSInteger)zk_second;
- (NSInteger)zk_weekday;    /* Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Thursday:5, Friday:6, Saturday:7 */

@end
