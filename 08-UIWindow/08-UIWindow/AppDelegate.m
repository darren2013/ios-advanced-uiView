//
//  AppDelegate.m
//  08-UIWindow
//
//  Created by 杜东方 on 15/11/26.
//  Copyright © 2015年 private. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //self.window.rootViewController = [[UIViewController alloc]init];
    ViewController *vc = [[ViewController alloc] init];
    
    //这种方式ios9.0已经不支持了
    /**
     ios7还支持，会出现以下问题
     1.当view发生一些事件的时候，会通知控制器，，但控制器已经销毁了，所以会出现一些未知错误
     
     2.当发生旋转事件的时候，UIApplication对象将旋转事件传递给UIWindow,UIWindow又将旋转事件传递给他的控制器，
     有根控制器决定是否要旋转，但通过这种方式添加，由于没有根控制器，所以不会旋转
     */
    //[self.window addSubview:vc.view];
    
    //设置UIWindown的根控制器
    self.window.rootViewController = vc;
    
    //ios7.0之前，不通过viewController也可以开发，但ios9.0不可以，ios9.0,一个UIWindow必须有一个rootViewController
   // UISwitch *switchBtn = [[UISwitch alloc] init];
    //[self.window addSubview:switchBtn];
    
    [self.window makeKeyAndVisible];
    
    //一个应用程序只能有一个主窗口
    UIWindow *w2 = [[UIWindow alloc] initWithFrame:CGRectMake(30,40, 100, 100)];
    w2.backgroundColor = [UIColor yellowColor];
    [w2 makeKeyAndVisible];
    w2.rootViewController = [[ViewController alloc] init];
    self.w2 = w2;
    
    
    
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow);
    return YES;
}


//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    //self.window.rootViewController = [[UIViewController alloc]init];
//    ViewController *vc = [[ViewController alloc] init];
//    
//    //这种方式ios9.0已经不支持了
//    /**
//     ios7还支持，会出现以下问题
//     1.当view发生一些事件的时候，会通知控制器，，但控制器已经销毁了，所以会出现一些未知错误
//     
//     2.当发生旋转事件的时候，UIApplication对象将旋转事件传递给UIWindow,UIWindow又将旋转事件传递给他的控制器，
//     有根控制器决定是否要旋转，但通过这种方式添加，由于没有根控制器，所以不会旋转
//     */
//    //[self.window addSubview:vc.view];
//    
//    //设置UIWindown的根控制器
//    self.window.rootViewController = vc;
//    [self.window makeKeyAndVisible];
//    return YES;
//}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
