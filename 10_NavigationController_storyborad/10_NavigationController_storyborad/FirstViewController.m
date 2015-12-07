//
//  FirstViewController.m
//  10_NavigationController_storyborad
//
//  Created by 杜东方 on 15/11/28.
//  Copyright © 2015年 private. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"first view did load");
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"first view will appear.");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"first view did appear.");
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"first view will disappear.");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"first view did disappear.");
}

-(void)dealloc{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
