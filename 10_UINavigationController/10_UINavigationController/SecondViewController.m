//
//  SecondViewController.m
//  10_UINavigationController
//
//  Created by 杜东方 on 15/11/28.
//  Copyright © 2015年 private. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
- (IBAction)backPreVC;
- (IBAction)jumpToNextViewController;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //这种方式不能把往左的箭头去掉
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_normal"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    //自定按钮设置在返回按钮是无效的,通过设置左边的barButtonItem生效
//    UIButton *btn = [[UIButton alloc] init];
//    btn.bounds = CGRectMake(0, 0, 46, 31);
//    [btn setBackgroundImage:[UIImage imageNamed:@"btn_back_normal"] forState:UIControlStateNormal];
//    //[btn setBackgroundImage:[UIImage imageNamed:@"btn_back_selected"] forState:UIControlStateHighlighted];
//    
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    self.navigationItem.backBarButtonItem = barButtonItem;
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

- (IBAction)backPreVC {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)jumpToNextViewController {
    ThirdViewController *viewController = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
