//
//  UIColor+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/4/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZKExtension)

+ (UIColor *)zk_colorWithHex:(NSInteger)RGBValue;
+ (UIColor *)zk_colorWithHex:(NSInteger)RGBValue alpha:(CGFloat)alpha;

@end
