//
//  ViewController.m
//  26_circle_progress
//
//  Created by 杜东方 on 15/12/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

@interface ViewController ()

- (IBAction)slideProgressChanged:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet CircleProgressView *circleView;

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

- (IBAction)slideProgressChanged:(UISlider *)sender {
    NSLog(@"%f",sender.value);
    self.circleView.progress = sender.value;
    
}
@end
