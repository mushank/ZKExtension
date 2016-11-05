//
//  NSObject+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZKExtension)

/**
 * Boolean function to check for null values. 
 * Handy when you need to both check for nil and [NSNUll null]
 */
- (BOOL)zk_isNull;

@end
