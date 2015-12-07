//
//  AppDelegate.m
//  08_UIWindow_singleView
//
//  Created by 杜东方 on 15/11/26.
//  Copyright © 2015年 private. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //有Main.storyboard的程序，启动时会隐式创建UIWindow对象
    NSLog(@"%@",self.window);
    NSLog(@"%@",self.window.rootViewController);
    return YES;
}



@end
