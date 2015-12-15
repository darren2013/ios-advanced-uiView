//
//  ViewController.m
//  29_pi_chart
//
//  Created by 杜东方 on 15/12/10.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "PiChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PiChartView *piChart = [[PiChartView alloc] init];
    
    
    piChart.frame = CGRectMake(50, 60, 200, 200);
    piChart.backgroundColor = [UIColor whiteColor];
    
    piChart.sections = @[@20.3,@40.5,@123.5,@66,@89.5];
    piChart.colors = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor yellowColor],[UIColor blackColor]];
    
    [self.view addSubview:piChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
