//
//  CircleProgress.m
//  26_circle_progress
//
//  Created by 杜东方 on 15/12/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import "CircleProgressView.h"

@implementation CircleProgressView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSString *progressInfo = [NSString stringWithFormat:@"%.2f",self.progress];
    CGFloat viewW = rect.size.width;
    CGFloat viewH = rect.size.height;
    CGFloat textW = 20;
    CGFloat textH = 20;
    
    CGFloat textX = (viewW - textW) * 0.5;
    CGFloat textY = (viewH - textH) * 0.5;
    
    
    [progressInfo drawInRect:CGRectMake(textX, textY, textW, textH) withAttributes:nil];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat radius = (viewW - 10) * 0.5;
    CGFloat endAngle = self.progress * 2 * M_PI - M_PI_4;
    CGContextAddArc(context, viewW * 0.5, viewH * 0.5, radius, -M_PI_4, endAngle, 0);
    
    CGContextStrokePath(context);
    
    
}


-(void)setProgress:(float)progress{
    _progress = progress;
    [self setNeedsDisplay];
}

@end
