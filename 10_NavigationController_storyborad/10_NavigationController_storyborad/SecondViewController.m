//
//  SecondViewController.m
//  10_NavigationController_storyborad
//
//  Created by 杜东方 on 15/11/28.
//  Copyright © 2015年 private. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

- (IBAction)back;
@end

//返回上一个控制器只能通过代码的方式，不能通过连线的方式
@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.bounds = CGRectMake(0, 0, 34, 41);
    imageView.image = [UIImage imageNamed:@"btn_back_normal"];
    
    
    self.navigationItem.titleView = imageView;
    
    NSLog(@"second view did load");
}



- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"second view will appear.");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"second view did appear.");
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"second view will disappear.");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"second view did disappear.");
}

-(void)dealloc{
    NSLog(@"%s",__func__);
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

- (IBAction)back {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
