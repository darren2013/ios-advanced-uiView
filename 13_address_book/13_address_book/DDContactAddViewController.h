//
//  DDContactEditViewController.h
//  13_address_book
//
//  Created by 杜东方 on 15/11/30.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDContact,DDContactAddViewController;

@protocol DDContactAddViewControllerDelegate <NSObject>

-(void)addContactWithEditViewController:(DDContactAddViewController *)contactViewController withContact:(DDContact *)contact;

@end

@interface DDContactAddViewController : UIViewController

@property(nonatomic,weak)id<DDContactAddViewControllerDelegate> delegate;

@end
