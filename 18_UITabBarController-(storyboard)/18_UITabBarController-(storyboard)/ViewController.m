//
//  ViewController.m
//  18_UITabBarController-(storyboard)
//
//  Created by 杜东方 on 15/12/6.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   UITabBar *tabBar = self.tabBarController.tabBar;

    for (UIView *subView in tabBar.subviews) {
        NSLog(@"%@",subView);
        
        //UITabBarButton为私有api,不允许访问
        //TabBar背景图片存储在ImageView中
        if (![subView isKindOfClass:[UIImageView class]]) {
            [subView removeFromSuperview];
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
