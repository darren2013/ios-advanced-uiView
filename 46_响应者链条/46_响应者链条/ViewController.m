//
//  ViewController.m
//  46_响应者链条
//
//  Created by 杜东方 on 15/12/16.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDRedViewController.h"

@interface ViewController ()

@property(nonatomic,strong)DDRedViewController *redViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DDRedViewController *redVc = [[DDRedViewController alloc] init];
    redVc.view.frame = CGRectMake(0, 39, 300, 300);
    
    [self.view addSubview:redVc.view];
    self.redViewController = redVc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end
