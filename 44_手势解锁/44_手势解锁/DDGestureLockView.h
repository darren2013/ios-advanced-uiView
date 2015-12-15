//
//  DDGestureLockView.h
//  44_手势解锁
//
//  Created by 杜东方 on 15/12/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDGestureLockView;

@protocol DDGestureLockView <NSObject>

-(void)gestureLockView:(DDGestureLockView *)view withPassword:(NSString *)password;

@end


@interface DDGestureLockView : UIView

@property(nonatomic,weak)id<DDGestureLockView> delegate;

@end
