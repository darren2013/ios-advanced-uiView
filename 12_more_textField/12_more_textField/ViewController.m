//
//  ViewController.m
//  12_more_textField
//
//  Created by 杜东方 on 15/11/29.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDKeyboardToolbar.h"

@interface ViewController ()<DDKeyboardToolbarDelegate>
@property (weak, nonatomic) IBOutlet UIView *registerVewContainer;

@property(nonatomic,strong)DDKeyboardToolbar *toolbar;

@property(nonatomic,strong)NSArray *uiTextFields;

@end

@implementation ViewController


-(DDKeyboardToolbar *)toolbar{
    if (!_toolbar) {
        _toolbar = [DDKeyboardToolbar keyboardToolbar];
        _toolbar.keyboardDelegate = self;
    }
    
    return _toolbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#warning 要去掉storyboard的sizeclasses，否则获取的subviews为空
    //NSLog(@"subViews:%@",self.registerVewContainer.subviews);
    
    NSMutableArray *textFields = [NSMutableArray array];
    
    for (UIView *view in self.registerVewContainer.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField*)view;
            textField.inputAccessoryView = self.toolbar;
            textField.tag = textFields.count;
            [textFields addObject:textField];
            
        }
    }
    
    self.uiTextFields = textFields;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHide) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)willHide{
    //恢复原状
    self.view.transform = CGAffineTransformIdentity;
    
    self.toolbar.preBarButtonItem.enabled = YES;
    self.toolbar.nextBarButtonItem.enabled = YES;
}

-(void)willShow:(NSNotification *)notiInfo{
   // NSLog(@"%@",notiInfo);
    NSInteger currentIndex = [self indexOfFirstResponder];
    
    //键盘一弹出，就判断当前键盘是否可用
    if (currentIndex == self.uiTextFields.count - 1) {
        self.toolbar.nextBarButtonItem.enabled = NO;
    }
    
    if (currentIndex == 0) {
        self.toolbar.preBarButtonItem.enabled = NO;
    }
    
    UITextField *currentTextField = self.uiTextFields[currentIndex];
    
    CGFloat textFieldMaxY = CGRectGetMaxY(currentTextField.frame) + self.registerVewContainer.frame.origin.y;
    CGFloat keyboardMaxY = [notiInfo.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;

    CGFloat delta = keyboardMaxY - textFieldMaxY;
    NSLog(@"delta:%f",delta);
    if (delta < 0) {
        self.view.transform = CGAffineTransformMakeTranslation(0, delta);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//获取当前正在激活的输入框
-(NSInteger)indexOfFirstResponder{
    
    for (UITextField *textField in self.uiTextFields) {
        if ([textField isFirstResponder])return textField.tag;
    }
    
    return -1;
}
    

-(void)next{
    NSInteger currentIndex = [self indexOfFirstResponder];
    NSLog(@"currentIndex:%ld,textCount:%ld",currentIndex,self.uiTextFields.count);
    
    self.toolbar.preBarButtonItem.enabled = YES;
    
    NSInteger nextIndex = currentIndex + 1;
    
//    if (nextIndex == self.uiTextFields.count - 1) {
//        self.toolbar.nextBarButtonItem.enabled = NO;
//    }
    
    [self.uiTextFields[currentIndex] resignFirstResponder];
    
    if (nextIndex < self.uiTextFields.count) {
        [self.uiTextFields[nextIndex] becomeFirstResponder];
    }
}

-(void)pre{
    NSInteger currentIndex = [self indexOfFirstResponder];
    
    self.toolbar.nextBarButtonItem.enabled = YES;
    
    NSInteger preIndex = currentIndex - 1;
    
    [self.uiTextFields[currentIndex] resignFirstResponder];
    
//    if (preIndex == 0) {
//        self.toolbar.preBarButtonItem.enabled = NO;
//    }
    
    if (preIndex >=0) {
        [self.uiTextFields[preIndex] becomeFirstResponder];
    }
}

#pragma mark keyboardToolbar delegate方法实现

-(void)keyboardToolbar:(DDKeyboardToolbar *)keyboardToolbar barButtonItemDidSelected:(UIBarButtonItem *)barButtonItem{
    
    switch (barButtonItem.tag) {
        case 1:
            [self pre];
            break;
        case 2:
            [self next];
            break;
        case 3:
            [UIView animateWithDuration:0.6 animations:^{
                [self.registerVewContainer endEditing:YES];
            }];

            break;
       
    }
    
   
}



@end
