//
//  UIViewController+ZKExtension.m
//  ZKExtension
//
//  Created by Jack on 11/1/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "UIViewController+ZKExtension.h"

@implementation UIViewController (ZKExtension)

- (void)zk_tapDismissKeyboard {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(whiteSpaceTapped:)];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    __weak UIViewController *weakSelf = self;
    
    [[NSNotificationCenter defaultCenter]addObserverForName:UIKeyboardWillShowNotification object:nil queue:mainQueue usingBlock:^(NSNotification *noti){
        [weakSelf.view addGestureRecognizer:tapGesture];
    }];
    [[NSNotificationCenter defaultCenter]addObserverForName:UIKeyboardWillHideNotification object:nil queue:mainQueue usingBlock:^(NSNotification *noti){
        [weakSelf.view removeGestureRecognizer:tapGesture];
    }];
}


#pragma mark - Private
- (void)whiteSpaceTapped:(UITapGestureRecognizer *)tapGesture {
    [self.view endEditing:YES];
}

@end
