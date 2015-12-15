//
//  DDGestureLockView.m
//  44_手势解锁
//
//  Created by 杜东方 on 15/12/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDGestureLockView.h"

@interface DDGestureLockView()

@property(nonatomic,strong)NSMutableArray *selectedBtns;

@property(nonatomic,assign)CGPoint lastPoint;

@end

@implementation DDGestureLockView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSMutableArray *)selectedBtns{
    if (!_selectedBtns) {
        _selectedBtns = [NSMutableArray array];
    }
    
    return _selectedBtns;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupBtns];
    }
    
    return self;
}

-(void)setupBtns{
    for (int i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        //按钮交互失效，不然无法显示selected状态
        btn.userInteractionEnabled = NO;
        [self addSubview:btn];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //当前滑动的点，如果在按钮上时，则选中按钮
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint =  [touch locationInView:touch.view];
    //NSLog(@"%ld",self.subviews.count);
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, currentPoint)) {
            //NSLog(@"YES");
           
            if (!btn.selected)[self.selectedBtns addObject:btn];
            
            
            btn.selected = YES;
        }else{
            self.lastPoint = currentPoint;
        }
    }
    
    [self setNeedsDisplay];
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //NSLog(@"%ld",self.selectedBtns.count);
    
   //[self.selectedBtns makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
    
    NSMutableString *pasword = [NSMutableString string];
    
    for (UIButton *btn in self.selectedBtns) {
        if(btn.selected){
            //NSLog(@"selected");
            [btn setSelected:NO];
        }
        
        [pasword appendFormat:@"%ld",btn.tag];
    }
    
    
    if ([self.delegate respondsToSelector:@selector(gestureLockView:withPassword:)]) {
        [self.delegate gestureLockView:self withPassword:pasword];
    }
    
    [self.selectedBtns removeAllObjects];
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    if (self.selectedBtns.count < 2) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    UIButton *firstBtn = self.selectedBtns[0];
    
    [path moveToPoint:firstBtn.center];
    
    for (int i = 1; i < self.selectedBtns.count; i++) {
        UIButton *btn = self.selectedBtns[i];
        [path addLineToPoint:btn.center];
    }
    
    [path addLineToPoint:self.lastPoint];
    
    path.lineWidth = 3;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor greenColor] set];
    [path stroke];
}

-(void)layoutSubviews{
    //记得要调用父类的
    [super layoutSubviews];
    CGFloat btnW = 74;
    CGFloat btnH = 74;
    
    for (int i=0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        NSInteger column = i % 3;
        NSInteger row = i / 3;
        CGFloat padding = ([UIScreen mainScreen].bounds.size.width - btnW * 3) / 4;
        
        CGFloat btnX = padding + (btnW + padding) * column;
        CGFloat btnY = padding + (btnH + padding) * row;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

@end
