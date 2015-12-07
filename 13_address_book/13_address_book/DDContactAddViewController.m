//
//  DDContactEditViewController.m
//  13_address_book
//
//  Created by 杜东方 on 15/11/30.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDContactAddViewController.h"
#import "DDContact.h"


@interface DDContactAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UIButton *addContactBtn;
- (IBAction)addContact;

@end

@implementation DDContactAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
    [defaultCenter addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.nameTextField];
    
    [defaultCenter addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.phoneTextField];
    
    
    
    
}

//视图将要出现时才召唤出键盘
-(void)viewDidAppear:(BOOL)animated{
    [self.nameTextField becomeFirstResponder];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) textChanged{
    self.addContactBtn.enabled = (self.nameTextField.text.length > 0 && self.phoneTextField.text.length > 0);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addContact {
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(addContactWithEditViewController:withContact:)]) {
        DDContact *contact = [[DDContact alloc] init];
        contact.name = self.nameTextField.text;
        contact.phone = self.phoneTextField.text;
        
        [self.delegate addContactWithEditViewController:self withContact:contact];
        
       
    }
}
@end
