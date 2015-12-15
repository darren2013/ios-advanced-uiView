//
//  DDGraphDrawingView.m
//  24_draw_graph
//
//  Created by 杜东方 on 15/12/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDGraphDrawingView.h"

@implementation DDGraphDrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self drawSector];
}


-(void)drawSector{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddArc(context, 100, 100, 60,-M_PI_4, -3 * M_PI_4, 1);
    CGContextClosePath(context);
    
    CGContextStrokePath(context);
}

-(void)drawArc{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
    
    //1逆时针 0顺时针
    CGContextAddArc(context, 100, 100, 60, 0, M_PI, 0);
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

-(void)drawCircle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 100, 100));
    
    CGContextStrokePath(context);
}

-(void)drawTriangle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    // CGContextSetLineWidth(context, 10);
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 110, 10);
    CGContextAddLineToPoint(context, 110, 110);
    //CGContextAddLineToPoint(context, 10, 10);
    //或者使用关闭路径的方式
    CGContextClosePath(context);
    
    CGContextStrokePath(context);
    //CGContextFillPath(context);
}


-(void)drawRectangle2{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(context, 10);
    
    CGContextAddRect(context, CGRectMake(10, 10, 100, 100));
    
    CGContextStrokePath(context);
    //CGContextFillPath(context);
}

-(void)drawRectangle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 110, 10);
    CGContextAddLineToPoint(context, 110, 110);
    CGContextAddLineToPoint(context, 10, 110);
    CGContextAddLineToPoint(context, 10, 10);
    
    //CGContextStrokePath(context);
    CGContextFillPath(context);
}


@end
