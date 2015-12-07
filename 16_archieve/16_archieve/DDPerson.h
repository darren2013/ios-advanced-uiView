//
//  DDPerson.h
//  16_archieve
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DDPerson : NSObject<NSCoding>

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,assign)float height;

@end
