//
//  AppDelegate.m
//  07_UIApplicationDelegate
//
//  Created by 杜东方 on 15/11/23.
//  Copyright © 2015年 private. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序启动完毕的时候就会调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"didFinishLaunching.....");
    return YES;
}

//失去焦点的时候,
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"resignActive.....");
}

//保存应用程序的数据及状态
//进入后台之后,5s之中很快变成suspend
//进入后台之前先失去焦点(不可交互)
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"background.....");
}

//恢复应用程序数据及状态
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"foreground......");
}

//进入foreground之后，再变成becomeActive
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive....");
}

//应用程序销毁的时候调用
//note:如果应用程序处于挂起状态时，则不会调用
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate.....");
}

//模拟器可以模拟
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    NSLog(@"applicationDidReceiveMemoryWarning.....");
}

@end
