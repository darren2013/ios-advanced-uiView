//
//  GreenView.m
//  45_触摸事件的传递
//
//  Created by 杜东方 on 15/12/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import "GreenView.h"

@implementation GreenView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

//判断当前的触摸点是否在自己身上
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    //绿色左边可以响应事件，右边不可以
    if (point.x < self.bounds.size.width * 0.5) {
        return YES;
    }
    
    
    //NSLog(@"%s",__func__);
    BOOL pointInside = [super pointInside:point withEvent:event];
    //NSLog(@"%d",pointInside);
    return pointInside;
}


@end
