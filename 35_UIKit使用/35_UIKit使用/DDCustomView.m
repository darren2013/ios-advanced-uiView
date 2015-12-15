//
//  DDCustomView.m
//  35_UIKit使用
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDCustomView.h"

@implementation DDCustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //UIKit方法虽然不用获取上下文，但内部都是使用上下文进行绘制
    
    /*
    UIRectFill(CGRectMake(20, 30, 100, 100));
    
    UIRectFrame(CGRectMake(20, 140, 80, 80));
    */
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(10, 10, 100, 100));
    CGPathAddEllipseInRect(path, NULL, CGRectMake(20, 20, 80, 80));
    
    //把路径添加到上下文中
    CGContextAddPath(context, path);
    
    CGContextStrokePath(context);
    
    //在ARC中，C语言创建的对象不会自动释放
    //凡是以create copy retain创建的对象都要进行release
    
    CGPathRelease(path);
    
    //或者使用通用的relase方法
    //CFRelease(path);
    
}


@end
