//
//  DDPainterView.m
//  41_涂鸦
//
//  Created by 杜东方 on 15/12/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDPainterView.h"

@interface DDPainterView()

@property(nonatomic,strong)NSMutableArray *paintLines;

@end

@implementation DDPainterView


-(NSMutableArray *)paintLines{
    if (!_paintLines) {
        _paintLines = [NSMutableArray array];
    }
    
    return _paintLines;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"paintCount:%ld",self.paintLines.count);
    if (self.paintLines.count < 2) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor redColor] set];
    CGPoint firstPoint = [self.paintLines[0] CGPointValue];
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    
    for (int i=1; i<self.paintLines.count; i++) {
        CGPoint point = [self.paintLines[i] CGPointValue];
        CGContextAddLineToPoint(context, point.x,point.y);
        
    }
    
    CGContextStrokePath(context);
    
    //[self.paintLines removeAllObjects];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:touch.view];
    
    [self.paintLines addObject:[NSValue valueWithCGPoint:point]];
    
    [self setNeedsDisplay];
    
}


@end
