//
//  ViewController.m
//  31_矩阵操作
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDCustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DDCustomView *view = [[DDCustomView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
