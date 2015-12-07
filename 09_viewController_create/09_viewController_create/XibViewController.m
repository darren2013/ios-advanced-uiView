//
//  XibViewController.m
//  09_viewController_create
//
//  Created by 杜东方 on 15/11/26.
//  Copyright © 2015年 private. All rights reserved.
//

#import "XibViewController.h"

@interface XibViewController ()

@end

@implementation XibViewController

//初始化控制器view
-(void)loadView{
    //self.view = [[UITableView alloc] init];
    
    //self.view会加载view,如果view不存在，则调用loadView加载控制器的view
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
