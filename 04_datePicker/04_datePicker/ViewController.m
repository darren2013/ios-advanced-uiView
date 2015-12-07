//
//  ViewController.m
//  04_datePicker
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // NSLog(@"%@",[NSLocale availableLocaleIdentifiers]);
    self.datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    self.datePicker.datePickerMode = UIDatePickerModeTime;
    
    //这样设置不行，datePicker已经有父view
    //self.textField.inputView = self.datePicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
