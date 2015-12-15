//
//  DDPainterView.m
//  43_涂鸦_BezierPath
//
//  Created by 杜东方 on 15/12/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDPainterView.h"

@interface DDPainterView()

@property(nonatomic,strong)NSMutableArray *bezierPathes;

@end

@implementation DDPainterView



-(NSMutableArray *)bezierPathes{
    if (!_bezierPathes) {
        _bezierPathes = [NSMutableArray array];
    }
    
    return _bezierPathes;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //一个bezierPath代表一条线
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:touch.view];
    
    [path moveToPoint:startPoint];
    
    [self.bezierPathes addObject:path];
    
    NSLog(@"%s=%ld",__func__,self.bezierPathes.count);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s=%ld",__func__,self.bezierPathes.count);
    UIBezierPath *path = [self.bezierPathes lastObject];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    [path addLineToPoint:point];
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
   NSLog(@"%s=%ld",__func__,self.bezierPathes.count);
    for (UIBezierPath *path in self.bezierPathes) {
        path.lineWidth = 3;
        path.lineCapStyle = kCGLineJoinRound;
        path.lineJoinStyle = kCGLineJoinRound;
        [path stroke];
    }
}


@end
