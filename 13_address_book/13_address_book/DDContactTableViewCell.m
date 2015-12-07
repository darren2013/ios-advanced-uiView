//
//  DDContactTableViewCell.m
//  13_address_book
//
//  Created by 杜东方 on 15/12/5.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDContactTableViewCell.h"
#import "DDContact.h"

@interface DDContactTableViewCell()

@property(nonatomic,weak)UIView *divider;
@end

@implementation DDContactTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"contacts";
    
    DDContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"initWithStyle");
    }
    return self;
}

-(void)setContact:(DDContact *)contact{
    _contact = contact;
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;
}

//如果控件是xib或storyboard创建出来的，就会调用这个方法
- (void)awakeFromNib {
    NSLog(@"awake from nib");
    // Initialization code
    UIView *underLineView = [[UIView alloc] init];
    underLineView.backgroundColor = [UIColor blackColor];
    underLineView.alpha = 0.3;
    self.divider = underLineView;
    
    [self.contentView addSubview:underLineView];
    
}


//控件frame被修改的时候会调用，一般用来布局子控件
-(void)layoutSubviews{
    //注意，一定要调用super layoutSubViews
    [super layoutSubviews];
    CGFloat lineX = 0;
    CGFloat lineW = self.frame.size.width;
    CGFloat lineH = 1;
    CGFloat lineY = self.frame.size.height - lineH;
    NSLog(@"%f---%f",self.frame.size.width,self.frame.size.height);
    self.divider.frame = CGRectMake(lineX, lineY, lineW, lineH);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
