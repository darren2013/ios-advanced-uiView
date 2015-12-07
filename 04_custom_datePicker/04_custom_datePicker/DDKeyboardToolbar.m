//
//  DDKeyboardToolbar.m
//  04_custom_datePicker
//
//  Created by 杜东方 on 15/11/22.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDKeyboardToolbar.h"

@interface DDKeyboardToolbar()

- (IBAction)doneClicked:(id)sender;

@end

@implementation DDKeyboardToolbar

+(instancetype)keyboardToolbar{
    return [[[NSBundle mainBundle] loadNibNamed:@"DDKeyboardToolbar" owner:nil options:nil] lastObject];
}


- (IBAction)doneClicked:(id)sender {
    
    if ([self.keyboardDelegate respondsToSelector:@selector(keyboardToolbar:btnClicked:)]) {
        [self.keyboardDelegate keyboardToolbar:self btnClicked:sender];
    }
}
@end
