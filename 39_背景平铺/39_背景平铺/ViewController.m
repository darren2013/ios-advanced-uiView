//
//  ViewController.m
//  39_背景平铺
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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"textBg"]];
    
    NSString *newsPath = [[NSBundle mainBundle] pathForResource:@"news" ofType:nil];
    
    NSString *newsContent = [NSString stringWithContentsOfFile:newsPath encoding:NSUTF8StringEncoding error:nil];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    //注意，不设置，背景图片不显示
    textView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:textView];
    textView.font = [UIFont systemFontOfSize:20];
    textView.text = newsContent;
    
    //这种方式添加后，下拉后，顶部会出现平铺的线
    //textView.backgroundColor = [UIColor colorWithPatternImage:[self dashImage]];
    
    
    //把文本的背景设置为一个图片
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    //计算文本的宽度和高度
    CGSize textSize = [newsContent boundingRectWithSize:CGSizeMake(screenW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:textView.font} context:nil].size;
    
    imageView.frame = CGRectMake(0, 0, textSize.width, textSize.height);
    
    //imageView.image = [self dashImage];
    imageView.backgroundColor = [UIColor colorWithPatternImage:[self dashImage]];
    
    [textView insertSubview:imageView atIndex:0];
    
    
}


-(UIImage *)dashImage{
    CGFloat bgH = 22;
    CGFloat bgW = [UIScreen mainScreen].bounds.size.width;
    
    UIGraphicsBeginImageContext(CGSizeMake(bgW, bgH));
    
    CGContextRef bitmapContext = UIGraphicsGetCurrentContext();
    
    CGFloat lineH = 1;
    CGFloat lineY = bgH - lineH;
    CGPoint linePoints[2] = {{0,lineY},{bgW,lineY}};
    CGFloat lengths[2] = {10,5};
    CGContextSetLineDash(bitmapContext, 0, lengths, 2);
    
    CGContextAddLines(bitmapContext, linePoints, 2);
    
    CGContextStrokePath(bitmapContext);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
