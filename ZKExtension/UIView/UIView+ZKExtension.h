//
//  UIView+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/2/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZKExtension)

- (void)zk_removeAllSubviews;

// Return self screenshot
- (UIImage *)zk_screenshot;

#pragma mark - Methods for cell
+ (UINib *)zk_nib;
+ (NSString *)zk_cellReuseIdentifier;

#pragma mark - Gesture with block callback
- (void)zk_setTapActionWithBlock:(void (^)(void))block;
- (void)zk_setLongPressActionWithBlock:(void (^)(void))block;

#pragma mark - Shortcut for frame
- (CGFloat)zk_x;
- (void)setZk_x:(CGFloat)x;
- (CGFloat)zk_y;
- (void)setZk_y:(CGFloat)y;
- (CGFloat)zk_centerX;
- (void)setZk_centerX:(CGFloat)centerX;
- (CGFloat)zk_centerY;
- (void)setZk_centerY:(CGFloat)centerY;
- (CGFloat)zk_width;
- (void)setZk_width:(CGFloat)width;
- (CGFloat)zk_height;
- (void)setZk_height:(CGFloat)height;
- (CGPoint)zk_origin;
- (void)setZk_origin:(CGPoint)origin;
- (CGSize)zk_size;
- (void)setZk_size:(CGSize)size;
- (CGFloat)zk_screenX;
- (CGFloat)zk_screenY;
- (CGFloat)zk_orientationWidth;
- (CGFloat)zk_orientationHeight;

@end
