//
//  UIImage+DD.h
//  36_生成水印
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DD)

+(UIImage *)waterImageWithBackgroundImageName:(NSString *)groundImageName waterImageName:(NSString *) waterImageName scale:(CGFloat)scale;



@end
