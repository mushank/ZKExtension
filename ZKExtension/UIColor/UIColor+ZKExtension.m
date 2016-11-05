//
//  UIColor+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/4/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "UIColor+ZKExtension.h"

@implementation UIColor (ZKExtension)

+ (UIColor *)zk_colorWithHex:(NSInteger)RGBValue {
    return [UIColor zk_colorWithHex:RGBValue alpha:1.0];
}

+ (UIColor *)zk_colorWithHex:(NSInteger)RGBValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((RGBValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((RGBValue & 0xFF00) >> 8)) / 255.0
                            blue:((float)(RGBValue & 0xFF))/255.0
                           alpha:alpha];
}

@end
