//
//  ViewController.m
//  14_plist_store
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)storeDataClicked;

- (IBAction)readDataClicked;

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

- (IBAction)storeDataClicked {
//    NSString *homeDic = NSHomeDirectory();
//    NSString *docPath = [homeDic stringByAppendingPathComponent:@"Documents"];
//    NSString *dataFilePath = [docPath stringByAppendingPathComponent:@"test.plist"];
//    NSLog(@"%@",docPath);
    /*
     NSDocumentDirectory,查找Documents文件夹
     NSUserDomainMask 在用户目录下查找
     YES代表用户目录~
     */
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataFilePath = [docPath stringByAppendingPathComponent:@"test2.plist"];
    
    NSArray *data = @[@"hello",@"world",@123];
    [data writeToFile:dataFilePath atomically:YES];
}

- (IBAction)readDataClicked {
}
@end
