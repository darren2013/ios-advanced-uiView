//
//  DDPerson.m
//  16_archieve
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDPerson.h"

@implementation DDPerson

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeFloat:self.height forKey:@"height"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.height = [aDecoder decodeFloatForKey:@"height"];
    }
    
    return self;
}
@end
