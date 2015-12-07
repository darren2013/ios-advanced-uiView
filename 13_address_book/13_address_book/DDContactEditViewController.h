//
//  DDContactEditViewController.h
//  13_address_book
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDContact,DDContactEditViewController;

@protocol DDContactEditViewControllerDelegate <NSObject>

-(void)contactEditViewController:(DDContactEditViewController *)contactEditViewController withContact:(DDContact *)contact;

@end

@interface DDContactEditViewController : UIViewController

@property(nonatomic,strong)DDContact *contact;

@property(nonatomic,weak)id<DDContactEditViewControllerDelegate> delegate;

@end
