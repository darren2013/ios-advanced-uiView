//
//  main.m
//  08_UIWindow_singleView
//
//  Created by 杜东方 on 15/11/26.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/*
 1.执行main.m的UIApplicationMain方法，
 
 2.创建UIApplication对象和UIApplicationDelegate对象，并将UIApplicationDelegate对象设置为UIApplication的代理
 
 3.查找Info.plist文件，Main story board file base name的配置，找到对应的storyboard文件，
   为storyboard文件初始化一个UIWindown对象；根据指定initial view controller，生成ViewController对象，并设置为
   UIWindow的rootViewController对象
 
 4.然后将UIWindow显示在screen上
 Main.storyborad初始化
 
 */

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
