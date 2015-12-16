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
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    [self.imageView addGestureRecognizer:panGestureRecognizer];
    
}


-(void)panAction:(UIPanGestureRecognizer *)panGestureRecognizer{
    //这个点是当前手指的位置，每次拖拽都是累加的
    CGPoint transition = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
    NSLog(@"%@",NSStringFromCGPoint(transition));
    
    CGPoint imageCenter = self.imageView.center;
    imageCenter.x += transition.x;
    imageCenter.y += transition.y;
    self.imageView.center = imageCenter;
    
    //清除累加的距离
    [panGestureRecognizer setTranslation:CGPointZero inView:panGestureRecognizer.view];
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
