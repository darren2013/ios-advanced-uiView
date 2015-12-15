//
//  ViewController.m
//  44_手势解锁
//
//  Created by 杜东方 on 15/12/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDGestureLockView.h"

@interface ViewController ()<DDGestureLockView>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]];
    
    DDGestureLockView *lockView = [[DDGestureLockView alloc] init];
    lockView.delegate = self;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    lockView.bounds = CGRectMake(0, 0, screenW, screenW);
    lockView.backgroundColor = [UIColor clearColor];
    //放到中间位置
    lockView.center = self.view.center;
    [self.view addSubview:lockView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gestureLockView:(DDGestureLockView *)view withPassword:(NSString *)password{
    if ([@"01234" isEqualToString:password]) {
        NSLog(@"passoword match,can go in");
    }else{
        NSLog(@"password incorrect,can't go in");
    }
}

@end
