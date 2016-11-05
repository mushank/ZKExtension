//
//  NSDictionary+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZKExtension)

// Cast to JSON string
- (NSString *)zk_toJSONString;

@end
