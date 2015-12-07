//
//  DDFlag.h
//  02_flagPickerView
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDFlag : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;

-(instancetype)initWithDic:(NSDictionary*)dic;

+(instancetype)flagWithDic:(NSDictionary*)dic;

+(NSArray*)flagList;

@end
