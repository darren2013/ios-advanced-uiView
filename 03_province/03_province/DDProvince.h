//
//  DDProvince.h
//  03_province
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDProvince : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSArray *cities;

-(instancetype)initWithDic:(NSDictionary*)dic;

+(instancetype)provinceWithDic:(NSDictionary*)dic;

+(NSArray*)provinceList;

@end
