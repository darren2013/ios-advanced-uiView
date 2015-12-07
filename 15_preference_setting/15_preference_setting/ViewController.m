//
//  ViewController.m
//  15_preference_setting
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)saveDataBtnClicked;

- (IBAction)readDataBtnClicked;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveDataBtnClicked {
    NSLog(@"%@",NSHomeDirectory());
    //NSUserDefaults会把所有数据都放在一个plist里，只适合保存配置相关信息，不适合保存大量数据
    //会将数据保存在沙盒里preference目录下
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //只调用了set没有调用synchronize时，数据会在某个时刻进行保存，但不确定
    [userDefaults setObject:@"hello" forKey:@"name"];
    [userDefaults setInteger:23 forKey:@"age"];
    
    [userDefaults synchronize];
}

- (IBAction)readDataBtnClicked {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *name = [userDefaults objectForKey:@"name"];
    NSInteger age = [userDefaults integerForKey:@"age"];
    
    NSLog(@"%@----%d",name,age);
}
@end
