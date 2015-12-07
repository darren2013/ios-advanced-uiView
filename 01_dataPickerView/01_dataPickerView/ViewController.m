//
//  ViewController.m
//  01_dataPickerView
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)NSArray *foods;

@property (weak, nonatomic) IBOutlet UILabel *drink;

@property (weak, nonatomic) IBOutlet UILabel *mainFood;

@property (weak, nonatomic) IBOutlet UILabel *fruit;

- (IBAction)randomBtnClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i=0; i<self.foods.count; i++) {
        
        [self pickerView:nil didSelectRow:0 inComponent:i];
    }
}

-(NSArray *)foods{
    if (!_foods) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"];
        _foods = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _foods;
}

#pragma mark--uipickerViewDataSource实现

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.foods.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *foodsInRow = self.foods[component];
    return foodsInRow.count;
}


#pragma mark--UiPickerView delegate

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
     NSArray *foodsInRow = self.foods[component];
    return foodsInRow[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"row:%ld,component:%ld",row,component);
    
    NSArray *foodsInRow = self.foods[component];
    NSString *food = foodsInRow[row];
    
    switch (component) {
        case 0:
            self.fruit.text = food;
            break;
        case 1:
            self.mainFood.text = food;
            break;
        case 2:
            self.drink.text = food;
            break;
    }
    
}
- (IBAction)randomBtnClicked:(id)sender {
    for (int i=0; i<self.foods.count; i++) {
        NSArray *foodsInComponent = self.foods[i];
        
        NSInteger random = arc4random_uniform((int)foodsInComponent.count);
        
        NSInteger oldRow = [self.pickerView selectedRowInComponent:i];
        
        while (random == oldRow) {
            random = (int)arc4random_uniform((int)foodsInComponent.count);
        }
        
        //更新label
        [self pickerView:nil didSelectRow:random inComponent:i];
        
        //更新pickerView值
        [self.pickerView selectRow:random inComponent:i animated:YES];
    }
}
@end
