//
//  RedView.m
//  45_触摸事件的传递
//
//  Created by 杜东方 on 15/12/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import "RedView.h"

@implementation RedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//不实现touchesBegan方法，默认会把事件传递给上一个响应者
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"%s,%p",__func__,event);
//    
//    //利用响应者链条，让多个控件同时处理【同一个事件】
//    [super touchesBegan:touches withEvent:event];
//}

@end
