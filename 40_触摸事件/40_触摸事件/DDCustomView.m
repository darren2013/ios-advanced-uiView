//
//  DDCustomView.m
//  40_触摸事件
//
//  Created by 杜东方 on 15/12/13.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDCustomView.h"

@implementation DDCustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    NSLog(@"%@",touch.view);
    
    NSLog(@"%ld",touch.tapCount);
    
    
    //获取当前触摸的位置
    //CGPoint location = [touch locationInView:self];
    //传空，是相对于window的位置
    CGPoint location = [touch locationInView:nil];
    NSLog(@"%@",NSStringFromCGPoint(location));
    
    NSLog(@"%s",__func__);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    CGPoint currentPosition = [touch locationInView:self];
    
    CGPoint previousPosition = [touch previousLocationInView:self];
    
    CGPoint center = self.center;
    
    center.x += currentPosition.x - previousPosition.x;
    center.y += currentPosition.y - previousPosition.y;
    
    self.center = center;
    
    NSLog(@"current location:%@,previous location:%@",NSStringFromCGPoint(currentPosition),NSStringFromCGPoint(previousPosition));
    
    
    NSLog(@"%s",__func__);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}


@end
