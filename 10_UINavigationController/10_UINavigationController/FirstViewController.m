//
//  FirstViewController.m
//  10_UINavigationController
//
//  Created by 杜东方 on 15/11/28.
//  Copyright © 2015年 private. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
- (IBAction)jumpToNextViewController;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"第一个控制器";
    
    self.title = @"第一个控制器w";
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
    UIBarButtonItem *barButtonItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:nil];
    self.navigationItem.leftBarButtonItems = @[barButtonItem,barButtonItem2];
    
    UIBarButtonItem *barButtonItem3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    self.navigationItem.rightBarButtonItem = barButtonItem3;
    //self.navigationItem.leftBarButtonItem = barButtonItem;
    
    //设置返回按钮，代表下一个控制器的返回按钮
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)jumpToNextViewController {
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
}
@end
