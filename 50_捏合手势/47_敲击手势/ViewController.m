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
    
    UIPinchGestureRecognizer *pinchGesRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    
    [self.imageView addGestureRecognizer:pinchGesRecognizer];
    
}


-(void)pinchAction:(UIPinchGestureRecognizer *)pinchRecognizer{
    NSLog(@"%s,scale=%f",__func__,pinchRecognizer.scale);
    //self.imageView.transform = CGAffineTransformMakeScale(pinchRecognizer.scale, pinchRecognizer.scale);
    
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinchRecognizer.scale, pinchRecognizer.scale);
    
    pinchRecognizer.scale = 1.0;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
