//
//  DDKeyboardToolbar.h
//  04_custom_datePicker
//
//  Created by 杜东方 on 15/11/22.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDKeyboardToolbar;


@protocol DDKeyboardToolbarDelegate <NSObject>

-(void)keyboardToolbar:(DDKeyboardToolbar*)keyboardToolbar btnClicked:(UIButton*)sender;

@end

@interface DDKeyboardToolbar : UIToolbar

+(instancetype)keyboardToolbar;

@property(nonatomic,weak)id<DDKeyboardToolbarDelegate> keyboardDelegate;

@end
