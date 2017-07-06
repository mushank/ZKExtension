//
//  NSDictionary+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZKExtension)

// Return safe object, replace `null` with `nil`
- (id)zk_objectForKey:(NSString *)key;

#pragma mark - Convert to JSON
- (NSString *)zk_toJSONString;
- (NSData *)zk_toJSONData;

@end
