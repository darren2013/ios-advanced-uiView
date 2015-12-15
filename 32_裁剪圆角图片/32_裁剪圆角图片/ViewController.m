//
//  ViewController.m
//  32_裁剪圆角图片
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDCircleView.h"

@interface ViewController ()

@property(nonatomic,weak)DDCircleView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DDCircleView *view = [[DDCircleView alloc] initWithFrame:CGRectMake(10, 20, 200, 200)];
    view.imageName = @"papa";
    view.borderWidth = 3;
    view.color = [UIColor blueColor];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    self.imageView = view;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.imageView.imageName = @"me";
}

@end
