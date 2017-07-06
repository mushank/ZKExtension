//
//  NSArray+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ZKExtension)

// Return safe object, replace `null` with `nil`
- (id)zk_objectAtIndex:(NSUInteger)index;

#pragma mark - Convert to JSON
- (NSString *)zk_toJSONString;
- (NSData *)zk_toJSONData;

@end
