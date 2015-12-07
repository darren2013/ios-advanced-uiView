//
//  ThirdViewController.m
//  10_NavigationController_storyborad
//
//  Created by 杜东方 on 15/11/28.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
- (IBAction)backToFirst;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"third view did load");
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"third view will appear.");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"third view did appear.");
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"third view will disappear.");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"third view did disappear.");
}

-(void)dealloc{
    NSLog(@"%s",__func__);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *subControllers = self.navigationController.childViewControllers;
    NSLog(@"%@",subControllers);
    NSArray *subControllers2 = self.navigationController.viewControllers;
    NSLog(@"%@",subControllers2);
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

- (IBAction)backToFirst {
    NSArray *subControllers = self.navigationController.childViewControllers;
    
    [self.navigationController popToViewController:subControllers[0] animated:YES];
}
@end
