//
//  DDCustomView.m
//  31_矩阵操作
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDCustomView.h"

@implementation DDCustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //平移，一定要在画之前平移
    //CGContextTranslateCTM(context, 50, 0);
    
    //CGContextScaleCTM(context, 3, 3);
    
    //旋转 负数：逆时针 正数：顺时针
    CGContextRotateCTM(context, M_PI * 0.3);
    
    CGPoint points[3] = {{60,50},{50,80},{100,50}};
    CGContextAddLines(context, points, 3);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    CGPoint linePoints[2] = {{60,20},{30,50}};
    CGContextAddLines(context, linePoints, 2);
    CGContextStrokePath(context);
    
    
}


@end
