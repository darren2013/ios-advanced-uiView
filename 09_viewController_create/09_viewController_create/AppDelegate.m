//
//  AppDelegate.m
//  09_viewController_create
//
//  Created by 杜东方 on 15/11/26.
//  Copyright © 2015年 private. All rights reserved.
//

#import "AppDelegate.h"
#import "XibViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow *windown = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //1.第一种方式创建控制器
    //bundle为nil,会从主bundle中加载
    //UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //获取箭头所指的控制器
    //id vc = [mainStoryboard instantiateInitialViewController];
    //根据viewController storyboardId加载控制器
    //id vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"redVC"];
    
    
    //2.直接创建控制器
    //UIViewController *vc = [[UIViewController alloc] init];
    //[vc.view setBackgroundColor:[UIColor greenColor]];
    
    //3.通过xib方式创建控制器;注意xib fileOwner属性
    //XibViewController *vc = [[XibViewController alloc] initWithNibName:@"XibViewController" bundle:nil];
    
    //如过不指定xib,缺省会加载同名的xib的view（XibViewController.xib）,
    XibViewController *vc = [[XibViewController alloc] init];
    
    windown.rootViewController = vc;
    //窗口称为主窗口并且可见
    [windown makeKeyAndVisible];
    self.window = windown;
    return YES;
}

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
