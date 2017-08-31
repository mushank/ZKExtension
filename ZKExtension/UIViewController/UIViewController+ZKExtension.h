//
//  UIViewController+ZKExtension.h
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZKExtension)

- (void)zk_tapDismissKeyboard;

+ (UIViewController *)zk_visibleViewController;
+ (UIViewController *)zk_popToRealRootViewControllerFromViewController:(UIViewController *)viewController;

@end
