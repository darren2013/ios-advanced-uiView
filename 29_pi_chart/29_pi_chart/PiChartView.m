//
//  PiChartView.m
//  29_pi_chart
//
//  Created by 杜东方 on 15/12/10.
//  Copyright © 2015年 private. All rights reserved.
//

#import "PiChartView.h"

@implementation PiChartView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.sections.count == 0) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat startAngle = 0;
    
    CGFloat circleX = rect.size.width * 0.5;
    CGFloat circleY = rect.size.height * 0.5;
    CGFloat radius = circleX;
    
    CGFloat sum = [[self.sections valueForKeyPath:@"@sum.self"] floatValue];
    NSLog(@"sum=%f",sum);
    
    for (int i = 0; i < self.sections.count; i++) {
        CGFloat eleData = [self.sections[i] floatValue];
        
        CGFloat scale = eleData / sum;
        CGFloat endAngle = scale * 2 * M_PI + startAngle;
        
        UIColor *color = self.colors[i];
        [color set];
        CGContextMoveToPoint(context, circleX, circleY);
        CGContextAddArc(context, circleX, circleY, radius, startAngle, endAngle, 0);
        
        CGContextFillPath(context);
        
        startAngle = endAngle;
    }
}

@end
