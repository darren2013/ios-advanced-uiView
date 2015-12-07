//
//  DDFlag.m
//  02_flagPickerView
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDFlag.h"

@implementation DDFlag

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self =[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+(instancetype)flagWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+(NSArray *)flagList{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"];
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:filePath]) {
        [result addObject:[self flagWithDic:dic]];
    }
    
    return result;
}
@end
