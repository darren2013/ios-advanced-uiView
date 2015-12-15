//
//  LineView.m
//  23_drawline_with_quartz2D
//
//  Created by 杜东方 on 15/12/7.
//  Copyright © 2015年 private. All rights reserved.
//

#import "LineView.h"

@implementation LineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //获取上下文,上下文的输出就当前view
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 10, 10);
    
    CGContextAddLineToPoint(context, 20, 100);
    
    //渲染到view上
    CGContextStrokePath(context);
}


@end
