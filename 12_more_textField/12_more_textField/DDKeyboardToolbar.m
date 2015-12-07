//
//  DDKeyboardToolbar.m
//  12_more_textField
//
//  Created by 杜东方 on 15/11/29.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDKeyboardToolbar.h"

@implementation DDKeyboardToolbar

+(instancetype)keyboardToolbar{
    return [[[NSBundle mainBundle] loadNibNamed:@"DDKeyboardToolbar" owner:nil options:nil] lastObject];
}

- (IBAction)barButtonItemClicked:(id)sender {
    if ([self.keyboardDelegate respondsToSelector:@selector(keyboardToolbar:barButtonItemDidSelected:)]) {
        [self.keyboardDelegate keyboardToolbar:self barButtonItemDidSelected:sender];
    }
}


@end
