//
//  ViewController.m
//  38_屏幕截图
//
//  Created by 杜东方 on 15/12/13.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *captureImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(captureImage);
    
    //开发时候，一般会把他保存在沙盒中
    [imageData writeToFile:@"/Users/darrendu/Desktop/capture.png" atomically:YES];
}

@end
