//
//  DDPainterView.m
//  42_涂鸦_画多条线
//
//  Created by 杜东方 on 15/12/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDPainterView.h"

@interface DDPainterView()

@property(nonatomic,strong)NSMutableArray *allLinesPoints;
@property(nonatomic,strong)NSMutableArray *allLineColors;


@end

@implementation DDPainterView


-(NSMutableArray *)allLinesPoints{
    if (!_allLinesPoints) {
        _allLinesPoints = [NSMutableArray array];
    }
    
    return _allLinesPoints;
}

-(NSMutableArray *)allLineColors{
    if (!_allLineColors) {
        _allLineColors = [NSMutableArray array];
    }
    
    return _allLineColors;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    for (int j = 0; j < self.allLinesPoints.count; j++) {
        
        NSArray *oneLinePoints = self.allLinesPoints[j];
        
        if (oneLinePoints.count < 2) continue;
        
        UIColor *lineColor = self.allLineColors[j];
        [lineColor set];
        
        CGPoint firstPoint = [oneLinePoints[0] CGPointValue];
        
        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
        
        for (int i = 1; i< oneLinePoints.count; i++) {
            CGPoint point = [oneLinePoints[i] CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        }
        
        CGContextStrokePath(context);
    }
    
    
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableArray *linePoints = [NSMutableArray array];
    
    [self.allLinesPoints addObject:linePoints];
    
    if (!self.currentColor) {
        [self.allLineColors addObject:[UIColor blackColor]];
    }else{
        [self.allLineColors addObject:self.currentColor];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //NSLog(@"touchCount:%ld",touches.count);
    
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:touch.view];
    
    [[self.allLinesPoints lastObject] addObject:[NSValue valueWithCGPoint:point]];
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"一共有%ld条线",self.allLinesPoints.count);
}


-(void)back{
    [self.allLinesPoints removeLastObject];
    
    [self setNeedsDisplay];
}

-(void)clear{
    [self.allLinesPoints removeAllObjects];
    
    [self setNeedsDisplay];
}

@end
