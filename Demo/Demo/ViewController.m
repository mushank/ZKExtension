//
//  ViewController.m
//  ZKExtension
//
//  Created by Jack on 11/5/16.
//  Copyright © 2016 mushank. All rights reserved.
//

#import "ViewController.h"
#import "ZKExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // For example
    NSString *str = @"Test";
    NSLog(@"Str is %@ Null", str.zk_isNull ? @"" : @"Not");
    
    NSArray *arr = @[@(1), @(2), @(3)];
    NSLog(@"Convert to JSON string: %@", arr.zk_toJSONString);
    
    NSString *Chinese = @"中国汉字";
    NSString *pinyin = [Chinese zk_toChinesePhoneticSymbol];
    NSLog(@"`%@` 的拼音是: `%@`", Chinese, pinyin);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
