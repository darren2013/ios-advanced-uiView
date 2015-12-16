//
//  ViewController.m
//  47_敲击手势
//
//  Created by 杜东方 on 15/12/16.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapGesRecognizer = [[UITapGestureRecognizer alloc] init];
    
    tapGesRecognizer.numberOfTapsRequired = 2;
    //手指数量
    //tapGesRecognizer.numberOfTouchesRequired = 2;
    
    tapGesRecognizer.delegate = self;
    
    //由于ImageView的UserInteractionEnable=false,所以先enable，才可以接受点击事件
    [self.imageView addGestureRecognizer:tapGesRecognizer];
    
    [tapGesRecognizer addTarget:self action:@selector(tapView:)];
}

-(void)tapView:(UITapGestureRecognizer *)tapGestureRecognizer{
    NSLog(@"tap gesture clicked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//告诉view能否接受触摸事件
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    CGPoint location = [touch locationInView:touch.view];
    
    //图片左边可以接受点击事件，右边不可以
    if (location.x <= touch.view.bounds.size.width * 0.5) {
        return YES;
    }
    
    
    return NO;
}

@end
