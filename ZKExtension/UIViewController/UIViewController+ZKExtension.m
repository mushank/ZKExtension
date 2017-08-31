//
//  UIViewController+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "UIViewController+ZKExtension.h"

@implementation UIViewController (ZKExtension)

+ (UIViewController *)zk_visibleViewController {
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController zk_queryUpperViewController:viewController];
}

+ (UIViewController *)zk_popToRealRootViewControllerFromViewController:(UIViewController *)viewController {
    if (viewController.presentingViewController != nil) {
        UIViewController *presentingVC = viewController.presentingViewController;
        [viewController dismissViewControllerAnimated:NO completion:nil];
        return [self zk_popToRealRootViewControllerFromViewController:presentingVC];
    } else if (viewController.parentViewController != nil) {
        if ([viewController.parentViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navigationController = (UINavigationController *)viewController.parentViewController;
            [navigationController popToRootViewControllerAnimated:NO];
            return [UIViewController zk_popToRealRootViewControllerFromViewController:navigationController];
        } else if ([viewController.parentViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabBarController = (UITabBarController *)viewController.parentViewController;
            return [UIViewController zk_popToRealRootViewControllerFromViewController:tabBarController];
        } else {
            return viewController.parentViewController;
        }
    } else {
        return viewController;
    }
}

- (void)zk_tapDismissKeyboard {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zk_whiteSpaceTapped:)];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    __weak UIViewController *weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:mainQueue usingBlock:^(NSNotification *noti){
        [weakSelf.view addGestureRecognizer:tapGesture];
    }];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:mainQueue usingBlock:^(NSNotification *noti){
        [weakSelf.view removeGestureRecognizer:tapGesture];
    }];
}


#pragma mark - Private
+ (UIViewController *)zk_queryUpperViewController:(UIViewController *)viewController {
    if (viewController.presentedViewController) {
        // Return presented view controller
        return [UIViewController zk_queryUpperViewController:viewController.presentedViewController];
    } else if ([viewController isKindOfClass:[UINavigationController class]]) {
        // Return top view controller
        UINavigationController *navigationController = (UINavigationController *)viewController;
        if (navigationController.viewControllers.count > 0) {
            return [UIViewController zk_queryUpperViewController:navigationController.topViewController];
        } else {
            return viewController;
        }
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        // Return selected view controller
        UITabBarController *tabBarController = (UITabBarController *)viewController;
        if (tabBarController.viewControllers.count > 0) {
            return [UIViewController zk_queryUpperViewController:tabBarController.selectedViewController];
        } else {
            return viewController;
        }
    } else if ([viewController isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side view controller
        UISplitViewController *splitViewController = (UISplitViewController *)viewController;
        if (splitViewController.viewControllers.count > 0) {
            return [UIViewController zk_queryUpperViewController:splitViewController.viewControllers.lastObject];
        } else {
            return viewController;
        }
    } else {
        // Unknown view controller type, return the last child view controller
        return viewController;
    }
}

- (void)zk_whiteSpaceTapped:(UITapGestureRecognizer *)tapGesture {
    [self.view endEditing:YES];
}

@end
