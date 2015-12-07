//
//  DDKeyboardToolbar.h
//  12_more_textField
//
//  Created by 杜东方 on 15/11/29.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDKeyboardToolbar;

@protocol DDKeyboardToolbarDelegate <NSObject>

@optional

-(void)keyboardToolbar:(DDKeyboardToolbar *)keyboardToolbar barButtonItemDidSelected:(UIBarButtonItem *)barButtonItem;

@end

@interface DDKeyboardToolbar : UIToolbar

@property(nonatomic,weak)id<DDKeyboardToolbarDelegate> keyboardDelegate;

+(instancetype)keyboardToolbar;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *preBarButtonItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextBarButtonItem;

@end
