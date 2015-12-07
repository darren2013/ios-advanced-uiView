//
//  ViewController.m
//  03_province
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDProvince.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)NSArray *provinces;

@property(nonatomic,assign)NSInteger  rowOfSelectedProv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"province count:%ld",[self.provinces count]);
}



- (NSArray *)provinces{
    if (!_provinces) {
        _provinces = [DDProvince provinceList];
    }
    
    return _provinces;
}

#pragma mark--UIPickerViewDataSource方法实现

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        return self.provinces.count;
    }
    DDProvince *province = self.provinces[self.rowOfSelectedProv];
    NSArray *citiesOfPro = province.cities;
    
    return citiesOfPro.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        DDProvince *province = self.provinces[row];
        return province.name;
    }else{
        DDProvince *province = self.provinces[self.rowOfSelectedProv];
        return province.cities[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        self.rowOfSelectedProv = row;
        
        [pickerView reloadComponent:1];
        
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}
@end
