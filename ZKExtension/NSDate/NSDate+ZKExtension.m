//
//  NSDate+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "NSDate+ZKExtension.h"

@implementation NSDate (ZKExtension)

- (NSString *)zk_stringInFormatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)zk_humanReadableTimeString {
    NSDate *now = [NSDate date];
    NSInteger time = [now timeIntervalSinceDate:self];
    NSString *str;
    if (time < 60) {
        str = @"Just Now";
    }else if(time < 60 * 60){
        str = [NSString stringWithFormat:@"%@m", @(time/60)];
    }else if(time < 24 * 60 * 60){
        str = [NSString stringWithFormat:@"%@h", @(time/3600)];
    }else if(time < 24 * 60 * 60 * 3){
        str = [NSString stringWithFormat:@"%@d", @(time/(3600*24))];
    }else if (self.zk_year == now.zk_year){
        NSArray *months = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sept",@"Oct",@"Nov",@"Dec",];
        str = [NSString stringWithFormat:@"%@ %ld", months[self.zk_month - 1], (long)self.zk_day];
    }else{
        NSArray *months = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sept",@"Oct",@"Nov",@"Dec",];
        str = [NSString stringWithFormat:@"%@ %ld, %ld", months[self.zk_month - 1], (long)self.zk_day, (long)self.zk_year];
    }
    return str;
}


#pragma mark - Extension for calendar
- (NSInteger)zk_year {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.year;
}

- (NSInteger)zk_month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = kCFCalendarUnitMonth;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.month;
}

- (NSInteger)zk_day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = kCFCalendarUnitDay;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.day;
}

- (NSInteger)zk_hour {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = kCFCalendarUnitHour;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.hour;
}

- (NSInteger)zk_minute {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = kCFCalendarUnitMinute;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.minute;
}

- (NSInteger)zk_second {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = kCFCalendarUnitSecond;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.second;
}

- (NSInteger)zk_weekday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = kCFCalendarUnitWeekday;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.weekday;
}

@end
