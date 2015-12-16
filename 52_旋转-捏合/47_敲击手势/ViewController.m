//
//  ViewController.m
//  47_敲击手势
//
//  Created by 杜东方 on 15/12/16.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //默认情况下，控件只能监听到一个手势，如果要监听多个手势，必须设置其中一个（任意一个）手势的代理，允许多个手势并存
    UIRotationGestureRecognizer *rotaionGesRecognizer = [[UIRotationGestureRecognizer alloc] init];
    
    rotaionGesRecognizer.delegate = self;
    [self.imageView addGestureRecognizer:rotaionGesRecognizer];
    
    [rotaionGesRecognizer addTarget:self action:@selector(rotaionAction:)];
    
    
    UIPinchGestureRecognizer *pinchGesRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    
    [self.imageView addGestureRecognizer:pinchGesRecognizer];
    
    
}


-(void)pinchAction:(UIPinchGestureRecognizer *)pinchGesRecognizer{
    NSLog(@"%s",__func__);
    
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinchGesRecognizer.scale, pinchGesRecognizer.scale);
    
    pinchGesRecognizer.scale = 1.0;
    
    
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


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}


@end
