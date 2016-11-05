//
//  NSDictionary+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "NSDictionary+ZKExtension.h"

@implementation NSDictionary (ZKExtension)

- (NSString *)zk_toJSONString {
    return [[NSString alloc] initWithData:[self toJSONData:self] encoding:NSUTF8StringEncoding];
}

#pragma mark - Private
- (NSData *)toJSONData:(id)obj {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
    if (jsonData.length > 0 && error == nil) {
        return jsonData;
    }else{
        return nil;
    }
}

@end
