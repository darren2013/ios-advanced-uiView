//
//  ViewController.m
//  37_截取图片(位图中截取)
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+DD.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView.image = [UIImage circleImageWithImageName:@"love" borderColor:[UIColor redColor] borderWidth:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage *image = [UIImage imageNamed:@"love"];
    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    //获取位图上下文,在自定义view的drawRect方法中，通过UIGraphicsGetCurrentContext获取的是Layer Graphics Context
    CGContextRef bitmapContext = UIGraphicsGetCurrentContext();
    
    //指定一个圆形路径，把圆形路径之外裁剪掉
    CGContextAddEllipseInRect(bitmapContext, imageRect);
    CGContextClip(bitmapContext);
    
    //添加图片
    [image drawInRect:imageRect];
    
    //添加边框,一定要放在添加图片后面
    [[UIColor blueColor] set ];
    CGContextSetLineWidth(bitmapContext, 3);
    CGContextAddEllipseInRect(bitmapContext, imageRect);
    CGContextStrokePath(bitmapContext);
    
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(newImage);
    [imageData writeToFile:@"/Users/darrendu/Desktop/new.png" atomically:YES];
    
    self.imageView.image = newImage;
    
    
    
}

@end
