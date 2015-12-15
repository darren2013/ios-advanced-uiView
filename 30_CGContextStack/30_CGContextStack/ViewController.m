//
//  ViewController.m
//  30_CGContextStack
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
    
    DDCustomView *customView = [[DDCustomView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    customView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:customView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
