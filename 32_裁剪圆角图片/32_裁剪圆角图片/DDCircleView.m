//
//  DDCircleView.m
//  32_裁剪圆角图片
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDCircleView.h"

@implementation DDCircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect imageRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGContextAddEllipseInRect(context, imageRect);
    //会将圆路径之前的裁剪掉
    CGContextClip(context);
    
    UIImage *image = [UIImage imageNamed:self.imageName];
    [image drawInRect:imageRect];
    
    [self.color set];
    CGContextSetLineWidth(context, self.borderWidth);
    CGContextAddEllipseInRect(context, imageRect);
    CGContextStrokePath(context);
}


-(void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    
    [self setNeedsDisplay];
}


@end
