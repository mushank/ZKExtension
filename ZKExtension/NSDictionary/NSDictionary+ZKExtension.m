//
//  NSDictionary+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "NSDictionary+ZKExtension.h"

@implementation NSDictionary (ZKExtension)

#pragma mark - Return safe object, replace `null` with `nil`
- (id)zk_objectForKey:(NSString *)key{
    id object = [self objectForKey:key];
    if ([object isEqual:[NSNull null]]) {
        object = nil;
    }
    return object;
}

#pragma mark - Convert to JSON
- (NSString *)zk_toJSONString {
    return [[NSString alloc] initWithData:[self zk_toJSONData] encoding:NSUTF8StringEncoding];
}

- (NSData *)zk_toJSONData{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (jsonData.length > 0 && error == nil) {
        return jsonData;
    }else{
        return nil;
    }
}

@end
