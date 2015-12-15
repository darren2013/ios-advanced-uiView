//
//  DDCustomView.m
//  34_多气球上升
//
//  Created by 杜东方 on 15/12/12.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDCustomView.h"

@interface DDCustomView()

@property(nonatomic,strong)NSMutableArray *locations;

@property(nonatomic,strong)NSMutableArray *ballonImages;

@end


@implementation DDCustomView


-(NSMutableArray *)locations{
    if (!_locations) {
        _locations = [NSMutableArray array];
        
        NSInteger count = 8;
        
       // UIImage *image = [UIImage imageNamed:@"sandyBalloon"];
        CGFloat leftMargin = 30;
        CGFloat imageDelta = 40;
        
        
        for (int i = 0; i < count; i++) {
           // [self.ballonImages addObject:image];
            
            CGPoint originPosition = CGPointMake(leftMargin + imageDelta * i, self.frame.size.height - 50);
            [self.locations addObject:[NSValue valueWithCGPoint:originPosition]];
        }
    }
    
    return _locations;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
        
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    
    return self;
}



//-(NSMutableArray *)ballonImages{
//    if (!_ballonImages) {
//        _ballonImages = [NSMutableArray array];
//        
//        NSInteger count = 6;
//        
//        UIImage *image = [UIImage imageNamed:@"sandyBalloon"];
//        CGFloat leftMargin = 30;
//        CGFloat imageDelta = 40;
//        
//        
//        for (int i = 0; i < count; i++) {
//            [self.ballonImages addObject:image];
//            
//            CGPoint originPosition = CGPointMake(leftMargin + imageDelta * i, self.frame.size.height - 100);
//            [self.locations addObject:[NSValue valueWithCGPoint:originPosition]];
//        }
//    }
//    
//    return _ballonImages;
//}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
     UIImage *image = [UIImage imageNamed:@"sandyBalloon"];
    CGFloat imageH = [image size].height;
    
    for (int i = 0; i < self.locations.count; i++) {
        CGPoint position = [self.locations[i] CGPointValue];
        position.y -= arc4random_uniform(10) * 0.5;
        
        if (position.y+imageH < 0) {
            position.y = self.frame.size.height;
        }
        self.locations[i] = [NSValue valueWithCGPoint:position];
        
        [image drawAtPoint:position];
    }
    
    
}


@end
