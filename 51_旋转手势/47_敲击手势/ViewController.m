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
    
    UIRotationGestureRecognizer *rotaionGesRecognizer = [[UIRotationGestureRecognizer alloc] init];
    
    [self.imageView addGestureRecognizer:rotaionGesRecognizer];
    
    [rotaionGesRecognizer addTarget:self action:@selector(rotaionAction:)];
    
    
}


-(void)rotaionAction:(UIRotationGestureRecognizer *)rotationGesRcognizer{
    NSLog(@"%s,%f",__func__,rotationGesRcognizer.rotation);
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotationGesRcognizer.rotation);
    
    //旋转角度也是累加的，所以每次需要重置
    
    rotationGesRcognizer.rotation = 0;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
