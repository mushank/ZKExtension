//
//  UIImage+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/4/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZKExtension)

+ (UIImage *)zk_imageWithColor:(UIColor *)color;
+ (UIImage *)zk_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
