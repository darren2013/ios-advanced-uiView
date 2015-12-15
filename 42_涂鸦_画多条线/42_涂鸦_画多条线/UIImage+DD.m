//
//  UIImage+DD.m
//  36_生成水印
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "UIImage+DD.h"

@implementation UIImage (DD)

+(UIImage *)waterImageWithBackgroundImageName:(NSString *)groundImageName waterImageName:(NSString *)waterImageName scale:(CGFloat)scale{
    UIImage *image = [UIImage imageNamed:groundImageName];
    
    //创建一个位图[图片]，开启位图上下文
    /*
     size:位图大小
     opaque:alpha通道 YES:不透明 NO 透明 使用NO,生成的更清晰
     scale:比例，设置0.0为屏幕的比例
     图片大小20x20  生成一张图片:20*scale X 20*scale
     */
    UIGraphicsBeginImageContextWithOptions(image.size, YES, scale);
    
    //画背景图
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //画水印
    CGFloat waterW = 80;
    CGFloat waterH = 60;
    CGFloat waterX = image.size.width - waterW;
    CGFloat waterY = image.size.height - waterH;
    
    UIImage *waterImage = [UIImage imageNamed:waterImageName];
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    //从位图中上下文中获取当前编辑的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束当前位图编辑
    UIGraphicsEndImageContext();
    
    return newImage;

}

+(UIImage *)circleImageWithImageName:(NSString *)imageName borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    UIImage *image = [UIImage imageNamed:imageName];
    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    //获取位图上下文,在自定义view的drawRect方法中，通过UIGraphicsGetCurrentContext获取的是Layer Graphics Context
    CGContextRef bitmapContext = UIGraphicsGetCurrentContext();
    
    //指定一个圆形路径，把圆形路径之外裁剪掉
    CGContextAddEllipseInRect(bitmapContext, imageRect);
    CGContextClip(bitmapContext);
    
    //添加图片
    [image drawInRect:imageRect];
    
    //添加边框,一定要放在添加图片后面
    [borderColor set ];
    CGContextSetLineWidth(bitmapContext, borderWidth);
    CGContextAddEllipseInRect(bitmapContext, imageRect);
    CGContextStrokePath(bitmapContext);
    
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //NSData *imageData = UIImagePNGRepresentation(newImage);
    //[imageData writeToFile:@"/Users/darrendu/Desktop/new.png" atomically:YES];
    
    return newImage;
}


+(UIImage *)captureImageOnView:(UIView *)view{
    UIGraphicsBeginImageContext(view.bounds.size);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
@end
