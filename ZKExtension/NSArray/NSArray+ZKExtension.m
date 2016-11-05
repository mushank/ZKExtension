//
//  NSArray+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "NSArray+ZKExtension.h"

@implementation NSArray (ZKExtension)

- (id)zk_objectAtIndex:(NSUInteger)index {
    NSAssert(index < self.count, @"Your array index %lu beyond bounds count = %lu", (unsigned long)index, (unsigned long)self.count);
    
    id object = nil;
    if (index < self.count) {
        object = [self objectAtIndex:index];
    }
    
    return object;
}

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
