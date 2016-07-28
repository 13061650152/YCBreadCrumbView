//
//  ViewController.m
//  YCBreadCrumbViewDemo
//
//  Created by zyc on 16/7/28.
//  Copyright © 2016年 zyc. All rights reserved.
//
#define kScreen_Width   [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height  [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "YCBreadCrumbView.h"

@interface ViewController ()<YCBreadCrumbViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *array = @[@"这是第一级", @"这是第二级", @"这是第三级", @"这是第四级这是第四级", @"这是第五级"];
    
    YCBreadCrumbView *breadView = [[YCBreadCrumbView alloc]initWithFrame:CGRectMake(30, 200, kScreen_Width - 60, 40)];
    breadView.backgroundColor = [UIColor grayColor];
    breadView.delegate = self;
    [self.view addSubview:breadView];
    
    [breadView setItems:array];
    
}
- (void)breadCrumbView:(YCBreadCrumbView *)view didTapItemAtIndex:(NSInteger)index{
    NSLog(@"%ld", (long)index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
