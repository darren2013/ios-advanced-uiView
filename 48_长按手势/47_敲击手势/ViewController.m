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
    
    UILongPressGestureRecognizer *longPressGesRecognizer = [[UILongPressGestureRecognizer alloc] init];
    
    //长按最小时间
    //longPressGesRecognizer.minimumPressDuration = 3;
    longPressGesRecognizer.allowableMovement = 30;
    
    [self.imageView addGestureRecognizer:longPressGesRecognizer];
    
    [longPressGesRecognizer addTarget:self action:@selector(longPressTap:)];
}

-(void)longPressTap:(UILongPressGestureRecognizer *)longPressRecognizer{
    NSLog(@"long press tap....%ld",longPressRecognizer.state);
    
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按手势开始...");
    }else if(longPressRecognizer.state == UIGestureRecognizerStateEnded){
        NSLog(@"长按手势结束...");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
