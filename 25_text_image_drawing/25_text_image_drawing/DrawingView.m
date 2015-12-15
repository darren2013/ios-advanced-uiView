//
//  DrawingView.m
//  25_text_image_drawing
//
//  Created by 杜东方 on 15/12/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat viewW = rect.size.width;
    CGFloat viewH = rect.size.height;
    
    UIImage *image = [UIImage imageNamed:@"papa"];
    //[image drawAtPoint:CGPointZero];
    
    //[image drawInRect:CGRectMake(10, 10, viewW, viewH)];
    
    [image drawAsPatternInRect:CGRectMake(10, 10, viewW, viewH)];
    
    NSString *text = @"明天菊花渠道铺货mate8，和已上市竞品相比，绝对占优，毕竟神兽950不发烧也能持久力，拉动超频马力MP4跑现有程序小CASE，唯一缺点是IMX298这个标称16M 1/2.8 PDAF的头~~~而16年这个噪点头会大行其道";
    //这种方式不会换行
    //[text drawAtPoint:CGPointZero withAttributes:nil];
    
    
    
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor redColor]};
    
    [text drawInRect:CGRectMake(0, 0, viewW, viewH * 0.5) withAttributes:attrs];
    
    
}


@end
