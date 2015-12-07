//
//  DDLoginViewController.m
//  13_address_book
//
//  Created by 杜东方 on 15/11/30.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDLoginViewController.h"
#import "MBProgressHUD+NJ.h"

#define DDACCOUNT @"account"
#define DDPWD @"pwd"
#define DDREMPWD @"remPwd"
#define DDAUTOLOGIN @"autoLogin"


@interface DDLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)remPWDChanged:(id)sender;
- (IBAction)autoLoginChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *remPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
- (IBAction)loginOnClicked;

@end

@implementation DDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
    //主要：object:一定要写上通知的发布者
    [defaultCenter addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.accountTextField];
    
    [defaultCenter addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.pwdTextField];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [self.remPwdSwitch setOn:[userDefaults boolForKey:DDREMPWD] animated:YES];
    
    if (self.remPwdSwitch.isOn) {
        self.accountTextField.text = [userDefaults objectForKey:DDACCOUNT];
        self.pwdTextField.text = [userDefaults objectForKey:DDPWD];
    }
    
    [self.autoLoginSwitch setOn:[userDefaults boolForKey:DDAUTOLOGIN] animated:YES];
    
    if (self.autoLoginSwitch.isOn) {
        [self loginOnClicked];
    }
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)textChanged{
    self.loginBtn.enabled = (self.accountTextField.text.length > 0 && self.pwdTextField.text.length > 0);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)remPWDChanged:(id)sender {
    
    if (!self.remPwdSwitch.isOn) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
    
}

- (IBAction)autoLoginChanged:(id)sender {
    if (self.autoLoginSwitch.isOn) {
        [self.remPwdSwitch setOn:YES animated:YES];
    }
}
- (IBAction)loginOnClicked {
    
    //[MBProgressHUD showMessage:@"正在加载中....."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.accountTextField.text isEqualToString:@"admin"] && [self.pwdTextField.text isEqualToString:@"admin"]) {
            [MBProgressHUD hideHUDForView:self.view];
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            [userDefaults setObject:self.accountTextField.text forKey:DDACCOUNT];
            
            if (self.remPwdSwitch.isOn) {
                [userDefaults setObject:self.pwdTextField.text forKey:DDPWD];
            }
            
            [userDefaults setBool:self.remPwdSwitch.isOn forKey:DDREMPWD];
            [userDefaults setBool:self.autoLoginSwitch.isOn forKey:DDAUTOLOGIN];
            [userDefaults synchronize];
            
            [self performSegueWithIdentifier:@"login2Contacts" sender:@"hello"];
        }else{
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号或密码不正确!!!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
//            [alertView show];
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"用户名或密码不正确"];
        }
        
       
        
        
    });
    
    
}

//在segue跳转之前调用
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"sender:%@",sender);
    
    NSLog(@"%@--%@---%@",segue.identifier,segue.sourceViewController,segue.destinationViewController);
    
    UIViewController *destinationController = segue.destinationViewController;
    
    destinationController.navigationItem.title = [NSString stringWithFormat:@"%@联系人列表",self.accountTextField.text];
    [MBProgressHUD hideHUDForView:destinationController.view];
    
    //之后会调用segue的perform方法,segue perform方法会执行
    
//    UIViewController *sourceViewController = segue.sourceViewController;
//    UINavigationController *navigationController = sourceViewController.navigationController;
//    
//    [navigationController pushViewController:segue.destinationViewController animated:YES];
}

@end
