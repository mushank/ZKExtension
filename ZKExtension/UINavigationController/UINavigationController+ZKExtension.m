//
//  UINavigationController+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/5/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "UINavigationController+ZKExtension.h"

@implementation UINavigationController (ZKExtension)

- (void)zk_popTwoViewControllerAnimated:(BOOL)animated {
    [self popViewControllerAnimated:NO];
    [self popViewControllerAnimated:animated];
}

@end
