//
//  ViewController.m
//  28_modal_viewcontroller
//
//  Created by 杜东方 on 15/12/9.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

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


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //RegisterViewController *revController = [[RegisterViewController alloc] init];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id revController = [storyboard instantiateViewControllerWithIdentifier:@"registerNavVc"];
    
    [self presentViewController:revController animated:YES completion:^{
        NSLog(@"加载模态窗口");
        
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        
        NSLog(@"%@",appDelegate.window.subviews);
    }];
}
@end
