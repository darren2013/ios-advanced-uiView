//
//  LittleYellowKitView.m
//  27_little_yellow_man
//
//  Created by 杜东方 on 15/12/9.
//  Copyright © 2015年 private. All rights reserved.
//

#import "LittleYellowKitView.h"
#define TOP_MARGIN 50
#define HEAD_RADIUS 80
#define  BODY_HEIGHT 200
#define GLASSES_HEIGHT 30

@implementation LittleYellowKitView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawBodyWithContext:context withRect:rect];
    
    CGFloat circleX = rect.size.width * 0.5;
    CGFloat circleY = TOP_MARGIN + HEAD_RADIUS;
    
    [[UIColor blackColor] set];
    CGFloat padding = 10;
    CGContextAddRect(context, CGRectMake(circleX - HEAD_RADIUS - padding, circleY, 2 * (padding + HEAD_RADIUS), GLASSES_HEIGHT));
    CGContextFillPath(context);
    
    
    [[UIColor whiteColor] set];
    
    //画左边的空白心圆
    CGFloat whiteRadius = HEAD_RADIUS * 0.5;
    CGContextAddArc(context, circleX - whiteRadius, circleY + GLASSES_HEIGHT * 0.5, whiteRadius, 0, 2 * M_PI, 0);
    CGContextFillPath(context);
    
    CGContextAddArc(context, circleX + whiteRadius, circleY + GLASSES_HEIGHT *0.5 , whiteRadius, 0, 2 * M_PI, 0);
    CGContextFillPath(context);
    
    [[UIColor blackColor] set];
    CGContextSetLineWidth(context, 13);
    CGContextAddArc(context, circleX - whiteRadius, circleY + GLASSES_HEIGHT * 0.5, whiteRadius, 0, 2 * M_PI, 0);
    CGContextStrokePath(context);
   
    CGContextAddArc(context, circleX + whiteRadius, circleY + GLASSES_HEIGHT *0.5 , whiteRadius, 0, 2 * M_PI, 0);

    CGContextStrokePath(context);
    
}

-(void)drawBodyWithContext:(CGContextRef)context withRect:(CGRect)rect{
    CGFloat circleX = rect.size.width * 0.5;
    CGFloat circleY = TOP_MARGIN + HEAD_RADIUS;

    [[UIColor yellowColor] set];
    CGContextAddArc(context, circleX, circleY, HEAD_RADIUS, 0, M_PI, 1);
    CGContextFillPath(context);
    
    CGContextAddRect(context, CGRectMake(circleX - HEAD_RADIUS, circleY, HEAD_RADIUS * 2, BODY_HEIGHT));
    CGContextFillPath(context);
    
    CGFloat bottomHeadCircleX = circleX;
    CGFloat bottonHeadCircleY = circleY + BODY_HEIGHT;
    CGContextAddArc(context, bottomHeadCircleX, bottonHeadCircleY, HEAD_RADIUS, 0, M_PI, 0);
    CGContextFillPath(context);
}


@end
