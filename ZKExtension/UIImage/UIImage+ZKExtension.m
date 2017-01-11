//
//  UIImage+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/4/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "UIImage+ZKExtension.h"

@implementation UIImage (ZKExtension)

+ (UIImage *)zk_imageWithColor:(UIColor *)color
{
    return [self zk_imageWithColor:color size:CGSizeMake(1.f, 1.f)];
}

+ (UIImage *)zk_imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)zk_imageWithLayer:(CALayer *)layer
{
    UIGraphicsBeginImageContext(layer.frame.size);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
