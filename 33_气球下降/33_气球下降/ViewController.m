//
//  ViewController.m
//  33_气球下降
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDBallonView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DDBallonView *ballonView = [[DDBallonView alloc] init];
    ballonView.frame = self.view.bounds;
    ballonView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:ballonView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
