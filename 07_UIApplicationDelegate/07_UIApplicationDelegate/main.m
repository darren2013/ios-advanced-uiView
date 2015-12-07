//
//  main.m
//  07_UIApplicationDelegate
//
//  Created by 杜东方 on 15/11/23.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/**
 iOS应用程序启动过程：
 打开程序，执行main.m文件中的main方法，执行UIApplicationMain函数，
 初始化UIApplication对象，创建并设置其代理对象，开启一个事件循环，监听系统事件，
 事件循环不断的从事件的队列里取出事件进行处理
 
 
 */


int main(int argc, char * argv[]) {
    @autoreleasepool {
        //第三个参数为nil,缺省为UIApplication对象，这里可以传入UIApplication子对象
        /**
         1.创建UIApplication对象
         2.创建AppDelegate对象
         3.设置UIApplication对象为刚创建出来的delegate对象
         4.开启一个事件循环
         */
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        //return UIApplicationMain(argc, argv, @"UIApplication", NSStringFromClass([AppDelegate class]));
        //return UIApplicationMain(argc, argv, @"UIApplication", @"AppDelegate");
    }
}
