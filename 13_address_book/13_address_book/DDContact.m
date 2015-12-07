//
//  DDContact.m
//  13_address_book
//
//  Created by 杜东方 on 15/12/4.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDContact.h"
#define DDNAME @"name"
#define DDPHONE @"phone"

@implementation DDContact

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:DDNAME];
    [aCoder encodeObject:self.phone forKey:DDPHONE];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:DDNAME];
        self.phone = [aDecoder decodeObjectForKey:DDPHONE];
    }
    
    return self;
}
@end
