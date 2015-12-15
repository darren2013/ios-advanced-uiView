//
//  ViewController.m
//  42_涂鸦_画多条线
//
//  Created by 杜东方 on 15/12/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDPainterView.h"
#import "UIImage+DD.h"

@interface ViewController ()
- (IBAction)back;
- (IBAction)save;

@property (weak, nonatomic) IBOutlet DDPainterView *painterView;

- (IBAction)clear;

- (IBAction)colorBtnClicked:(id)sender;


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

- (IBAction)back {
    [self.painterView back];
}

- (IBAction)save {
    UIImage *image = [UIImage captureImageOnView:self.painterView];
    
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:@"/Users/darrendu/paintCapture.png" atomically:YES];
}

- (IBAction)clear {
    [self.painterView clear];
}

- (IBAction)colorBtnClicked:(id)sender {
    UIButton *btn = (UIButton*)sender;
    
    self.painterView.currentColor = btn.backgroundColor;
}


@end
