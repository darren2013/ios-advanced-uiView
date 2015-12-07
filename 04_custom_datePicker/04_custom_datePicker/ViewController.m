//
//  ViewController.m
//  04_custom_datePicker
//
//  Created by 杜东方 on 15/11/22.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDKeyboardToolbar.h"

@interface ViewController ()<DDKeyboardToolbarDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property(nonatomic,strong)UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    self.datePicker.datePickerMode = UIDatePickerModeTime;
    
    self.textField.inputView = self.datePicker;
    
    //self.textField.inputAccessoryView = [self uiToolbarWithCode];
    DDKeyboardToolbar *keyboardToolbar = [DDKeyboardToolbar keyboardToolbar];
    keyboardToolbar.keyboardDelegate = self;
    
    self.textField.inputAccessoryView = keyboardToolbar;
    
}

-(UIToolbar*)uiToolbarWithCode{
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.backgroundColor = [UIColor grayColor];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    toolBar.bounds = CGRectMake(0, 0, screenW, 44);
    
    UIBarButtonItem *preItem = [[UIBarButtonItem alloc] initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem *fixedBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:nil action:nil];
    //代码生成，要指定宽度
    fixedBarItem.width = 20;
    
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem *flexibleBarTime = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFlexibleSpace) target:nil action:nil];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:(UIBarButtonItemStylePlain) target:nil action:nil];
    
    toolBar.items = @[preItem,fixedBarItem,nextItem,flexibleBarTime,doneItem];
    
    return toolBar;
}


#pragma mark--keyboard toolbar delegate方法实现

-(void)keyboardToolbar:(DDKeyboardToolbar *)keyboardToolbar btnClicked:(UIButton *)sender{
   NSDate *date = self.datePicker.date;
   NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
   dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    self.textField.text = [dateFormatter stringFromDate:date];
}


@end
