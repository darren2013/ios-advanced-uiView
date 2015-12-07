//
//  DDContactTableViewCell.h
//  13_address_book
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDContact;

@interface DDContactTableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong)DDContact *contact;

@end
