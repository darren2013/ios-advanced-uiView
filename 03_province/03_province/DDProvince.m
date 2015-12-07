//
//  DDProvince.m
//  03_province
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDProvince.h"

@implementation DDProvince

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)provinceWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+(NSArray *)provinceList{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"];
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:filePath]) {
        [result addObject:[self provinceWithDic:dic]];
    }
    
    return result;
}
@end
