//
//  ViewController.m
//  02_flagPickerView
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDFlag.h"
#import "DDFlagPickerView.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)NSArray *flags;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"flagCount:%ld",self.flags.count);
}


-(NSArray *)flags{
    if (!_flags) {
        _flags = [DDFlag flagList];
    }
    
    return _flags;
}

#pragma mark--UI PickerView DataSource方法实现

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count;
}

#pragma mark--UIPickerViewDelegate方法实现

-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    DDFlagPickerView *flagPickerView = (DDFlagPickerView*)view;
    
    if (!flagPickerView) {
        flagPickerView = [DDFlagPickerView flagPickerView];
    }
    
    DDFlag *flag = self.flags[row];
    flagPickerView.flag = flag;
    NSLog(@"%@----%p",flag.name,flagPickerView);
    return flagPickerView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 60;
}



@end
