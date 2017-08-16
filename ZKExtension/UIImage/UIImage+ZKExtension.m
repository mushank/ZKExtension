//
//  UIImage+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/4/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "UIImage+ZKExtension.h"

@implementation UIImage (ZKExtension)

+ (UIImage *)zk_imageWithColor:(UIColor *)color{
    return [self zk_imageWithColor:color size:CGSizeMake(1.f, 1.f)];
}

+ (UIImage *)zk_imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)zk_imageWithLayer:(CALayer *)layer{
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, NO, 0.0f);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)zk_resizeToSize:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
