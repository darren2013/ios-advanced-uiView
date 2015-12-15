//
//  DDBallonView.m
//  33_气球下降
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDBallonView.h"

@interface DDBallonView()

@property(nonatomic,assign) CGPoint position;

@property(nonatomic,strong)CADisplayLink *link;

@end


@implementation DDBallonView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //结构体不能直接赋值
    CGPoint movedToPosition = self.position;
    movedToPosition.y += 10;
    
    if(movedToPosition.y > rect.size.height){
        movedToPosition.y = 0;
    }
    
    self.position = movedToPosition;
    
    UIImage *image = [UIImage imageNamed:@"sandyBalloon"];
    [image drawAtPoint:self.position];
}


-(instancetype)initWithFrame:(CGRect)frame{
    NSLog(@"%s",__func__);
    
    if (self = [super initWithFrame:frame]) {
        [self addAnimation];
    }
    
    return self;
}


//注意：init 方法内部会调用 initWithFrame方法
//-(instancetype)init{
//    NSLog(@"%s",__func__);
//    
//    if (self = [super init]) {
//        
//        
//    }
//    
//    return self;
//}

//view只有从storyboard或xib中创建时候，这个方法才会调用
-(void)awakeFromNib{
    [self addAnimation];
}

-(void)addAnimation{
    //[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    
    //1秒钟执行60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    self.link = link;
    NSLog(@"%f",link.duration);
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.link invalidate];
}

@end
