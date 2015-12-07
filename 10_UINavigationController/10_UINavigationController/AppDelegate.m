//
//  AppDelegate.m
//  10_UINavigationController
//
//  Created by 杜东方 on 15/11/28.
//  Copyright © 2015年 private. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/**
 导航控制器的结构：
 导航控制器有一个导航条和显示view组成，导航控制器会把管理的所有viewController放在栈的数据结构中，
 push一个控制器时，会把先前的控制器view从navigationController上移走，但不销毁，然后将栈顶得控制器显示出来；
 pop一个控制器时，除了将当前的控制器view从navigationController上移走，还要从栈中移除并销毁
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc] init];
    
    UIViewController *rootViewController = [[FirstViewController alloc] init];
    //rootViewController.view.backgroundColor = [UIColor redColor];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    self.window = window;
    
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
