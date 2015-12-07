//
//  ViewController.m
//  06_UIApplication
//
//  Created by 杜东方 on 15/11/23.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /**
     UIApplication是应用程序的特征；每一个应用都有自己的UIApplication对象，而且是单例的；
     iOS程序启动后创建的第一个对象就是UIApplication对象；
     利用UIApplication对象可以进行一些应用级别的操作
     */
    
    
//    
//    UIApplication *app1 = [UIApplication sharedApplication];
//    UIApplication *app2 = [UIApplication sharedApplication];
//    //UIApplication *app3 = [[UIApplication alloc] init];
//    
//    NSLog(@"%p---%p",app1,app2);
    
    
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) clicked{
    NSLog(@"点我啊");
    UIApplication *app = [UIApplication sharedApplication];
    //UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    //[[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    //app.applicationIconBadgeNumber = 332;
    
    //状态栏菊花
    //app.networkActivityIndicatorVisible = YES;
    
    /*
     控制器可以管理状态栏；UIApplication也可以管理状态栏；
     控制器管理状态栏可以保证每个页面都不一样，而UIApplication是全局的
     缺省是交给控制器管理的,如果需要给UIApplication管理，则在Info.plist中设置：ViewController-base status bar hidden
     

     */
    
    //app.statusBarStyle = UIStatusBarStyleLightContent;
    //app.statusBarHidden = YES;
    
    NSURL *url = [NSURL URLWithString:@"http://blog.csdn.net/tmweipan/article/details/39832059"];
    [app openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
