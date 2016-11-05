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


// Cast to JSON string
- (NSString *)zk_toJSONString;

@end
