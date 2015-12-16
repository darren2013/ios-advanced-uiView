//
//  ViewController.m
//  47_敲击手势
//
//  Created by 杜东方 on 15/12/16.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipGesRecognizer = [[UISwipeGestureRecognizer alloc] init];
    
    swipGesRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:swipGesRecognizer];
    
    [swipGesRecognizer addTarget:self action:@selector(swipAction:)];
}

-(void)swipAction:(UISwipeGestureRecognizer *)swipRecognizer{
    NSLog(@"%s,%ld",__func__,swipRecognizer.state);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
