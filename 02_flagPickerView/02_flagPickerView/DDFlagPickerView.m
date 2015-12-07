//
//  DDFlagPickerView.m
//  02_flagPickerView
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDFlagPickerView.h"
#import "DDFlag.h"

@interface DDFlagPickerView()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end

@implementation DDFlagPickerView

+(instancetype)flagPickerView{
    return [[[NSBundle mainBundle] loadNibNamed:@"DDFlagPickerView" owner:nil options:nil] lastObject];
}

-(void)setFlag:(DDFlag *)flag{
    _flag = flag;
    
    self.name.text = flag.name;
    self.icon.image = [UIImage imageNamed:flag.icon];
}

@end
