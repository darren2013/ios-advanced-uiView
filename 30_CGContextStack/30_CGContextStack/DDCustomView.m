//
//  DDCustomView.m
//  30_CGContextStack
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
    
    //保存一个绘图的上下文状态到一个栈里
    CGContextSaveGState(context);
    CGContextSaveGState(context);
    
    
    [[UIColor redColor] set];
    CGContextSetLineWidth(context, 12);
    CGContextAddRect(context, CGRectMake(10, 40, 80, 80));
    CGContextStrokePath(context);
    
    
    //从一个栈里恢复保存的上下文状态
    CGContextRestoreGState(context);
//    [[UIColor blackColor] set];
//    CGContextSetLineWidth(context, 1);
    CGContextAddRect(context, CGRectMake(10, 130, 50, 50));
    CGContextStrokePath(context);
    //保存了几次，才可以恢复几次
    CGContextRestoreGState(context);
    
}


@end
