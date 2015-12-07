//
//  DDFlagPickerView.h
//  02_flagPickerView
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDFlag;

@interface DDFlagPickerView : UIView

@property(nonatomic,strong)DDFlag *flag;

+(instancetype)flagPickerView;

@end
