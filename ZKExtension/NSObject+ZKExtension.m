//
//  NSObject+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "NSObject+ZKExtension.h"

@implementation NSObject (ZKExtension)

- (BOOL)zk_isNull {
    if (!self || [self isEqual:[NSNull null]]) return YES;
    return NO;
}


@end
