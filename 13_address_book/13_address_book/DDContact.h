//
//  DDContact.h
//  13_address_book
//
//  Created by 杜东方 on 15/12/4.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDContact : NSObject<NSCoding>

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *phone;

@end
