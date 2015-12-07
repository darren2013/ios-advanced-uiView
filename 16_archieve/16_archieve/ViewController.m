//
//  ViewController.m
//  16_archieve
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDPerson.h"

@interface ViewController ()
- (IBAction)saveDataBtnClicked;

- (IBAction)readDataBtnClicked;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveDataBtnClicked {
    DDPerson *person = [[DDPerson alloc] init];
    person.name = @"zhangsan";
    person.age = 23;
    person.height = 23.4;
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *dataFilePath = [docPath stringByAppendingPathComponent:@"person.arc"];
    
    [NSKeyedArchiver archiveRootObject:person toFile:dataFilePath];
    NSLog(@"%@",NSHomeDirectory());
    
}

- (IBAction)readDataBtnClicked {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *personFile = [docPath stringByAppendingPathComponent:@"person.arc"];
    
    DDPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:personFile];
    
    NSLog(@"%@---%ld---%1.f",person.name,person.age,person.height);
}
@end
