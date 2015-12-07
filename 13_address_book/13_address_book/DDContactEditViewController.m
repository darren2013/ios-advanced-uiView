//
//  DDContactEditViewController.m
//  13_address_book
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDContactEditViewController.h"
#import "DDContact.h"

@interface DDContactEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
- (IBAction)editBtnClicked:(UIBarButtonItem *)sender;


@property (weak, nonatomic) IBOutlet UIButton *saveContactBtn;
- (IBAction)saveContact:(id)sender;

@end

@implementation DDContactEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameTextField.text = _contact.name;
    self.phoneTextField.text = _contact.phone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 由于是在prepardForSegue中setContact,也就是在控制器跳转之前，由于viewController中得view是懒加载，
 所以此时nameTextField phoneTextField都是null值
 */
//-(void)setContact:(DDContact *)contact{
//    _contact = contact;
//    
//    self.nameTextField.text = _contact.name;
//    self.phoneTextField.text = _contact.phone;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveContact:(id)sender {
    NSLog(@"save contact...");
    if ([self.delegate respondsToSelector:@selector(contactEditViewController:withContact:)]) {
        [self.navigationController popViewControllerAnimated:YES];
        self.contact.name = self.nameTextField.text;
        self.contact.phone = self.phoneTextField.text;
        
        [self.delegate contactEditViewController:self withContact:self.contact];
    }
}
- (IBAction)editBtnClicked:(UIBarButtonItem *)sender {
    if (self.nameTextField.enabled) {
        sender.title = @"编辑";
        self.nameTextField.enabled = NO;
        self.phoneTextField.enabled = NO;
        self.saveContactBtn.hidden = YES;
    }else{
        sender.title = @"取消";
        self.nameTextField.enabled = YES;
        self.phoneTextField.enabled = YES;
        self.saveContactBtn.hidden = NO;
        
        [self.phoneTextField becomeFirstResponder];
    }
    
}
@end
