//
//  UIView+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/2/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "UIView+ZKExtension.h"
#import <objc/runtime.h>

static char kZKActionHandlerTapBlockKey;
static char kZKActionHandlerTapGestureKey;
static char kZKActionHandlerLongPressBlockKey;
static char kZKActionHandlerLongPressGestureKey;

@implementation UIView (ZKExtension)

- (void)zk_removeAllSubviews {
    while (self.subviews.count) {
        UIView *subView = self.subviews.lastObject;
        [subView removeFromSuperview];
    }
}

- (UIImage *)zk_screenshot {
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

#pragma mark - Methods for cell
+ (UINib *)zk_nib {
    return [UINib nibWithNibName:NSStringFromClass(self.class) bundle:[NSBundle mainBundle]];
}

+ (NSString *)zk_cellReuseIdentifier {
    return NSStringFromClass(self.class);
}


#pragma mark - Gesture with block callback | Public
- (void)zk_setTapActionWithBlock:(void (^)(void))block {
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kZKActionHandlerTapGestureKey);
    
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kZKActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }

    objc_setAssociatedObject(self, &kZKActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)zk_setLongPressActionWithBlock:(void (^)(void))block {
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kZKActionHandlerLongPressGestureKey);
    
    if (!gesture) {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kZKActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kZKActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

#pragma mark - Gesture with block callback | Private
- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        void(^action)(void) = objc_getAssociatedObject(self, &kZKActionHandlerTapBlockKey);
        
        if (action) {
            action();
        }
    }
}

- (void)handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        void(^action)(void) = objc_getAssociatedObject(self, &kZKActionHandlerLongPressBlockKey);
        
        if (action) {
            action();
        }
    }
}

#pragma mark - Shrotcut for frame
- (CGFloat)zk_x {
    return self.frame.origin.x;
}

- (void)setZk_x:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)zk_y {
    return self.frame.origin.y;
}

- (void)setZk_y:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)zk_centerX {
    return self.center.x;
}

- (void)setZk_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)zk_centerY {
    return self.center.y;
}

- (void)setZk_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)zk_width {
    return self.frame.size.width;
}

- (void)setZk_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)zk_height {
    return self.frame.size.height;
}

- (void)setZk_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)zk_origin {
    return self.frame.origin;
}

- (void)setZk_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)zk_size {
    return self.frame.size;
}

- (void)setZk_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)zk_screenX {
    CGFloat x = 0.0f;
    for (UIView *view = self; view; view = view.superview) {
        x += view.zk_x;
    }
    return x;
}

- (CGFloat)zk_screenY {
    CGFloat y = 0.0f;
    for (UIView *view = self; view; view = view.superview) {
        y += view.zk_y;
    }
    return y;
}

- (CGFloat)zk_orientationWidth {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.zk_height : self.zk_width;
}

- (CGFloat)zk_orientationHeight {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.zk_width : self.zk_height;
}

@end
