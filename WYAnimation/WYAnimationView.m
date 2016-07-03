//
//  WYAnimationView.m
//  WYBreath
//
//  Created by wangyu on 16/6/30.
//  Copyright © 2016年 wangyu. All rights reserved.
//

#import "WYAnimationView.h"
#import "UIColor+extend.h"

@interface WYAnimationView ()

{
    CGFloat lW;//如果是拖拽的xib,要自己手动设置尺寸，如果是代码init,无需自己设置
}

@end

@implementation WYAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        lW = frame.size.width;
        [self setLayer];
    }
    return self;
}

-(void)setLayer{
    CALayer * lay = [[CALayer alloc] init];
    lay.frame = CGRectMake(0, 0, lW, lW);
    lay.cornerRadius = lW/2;
    [lay setBackgroundColor:[[UIColor getColor:@"ff5656" alpha:0.6] CGColor]];
    [self.layer addSublayer:lay];
    
    CALayer * lay1 = [[CALayer alloc] init];
    lay1.frame = CGRectMake(0, 0, lW, lW);
    lay1.cornerRadius = lW/2;
    [lay1 setBackgroundColor:[[UIColor getColor:@"ff5656" alpha:0.9] CGColor]];
    [self.layer addSublayer:lay1];
}

-(void)animation:(BOOL)isAnimaioan{
    if (isAnimaioan) {
        [self startAnimation];
    }else{
        [self stopAnimation];
    }
}
-(void)startAnimation{
    self.hidden = NO;
    CALayer * lay = (CALayer *)[self.layer.sublayers firstObject];
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    k.duration = 1.0;
    k.values = @[@(0.2),@(0.5),@(0.2)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.99),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    k.repeatCount=FLT_MAX;
    [lay addAnimation:k forKey:@"SHOW"];
    
    CAKeyframeAnimation *k1 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k1.duration = 1.0;
    k1.values = @[@(1.0),@(1.5),@(1.0)];
    k1.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k1.repeatCount=FLT_MAX;
    k1.calculationMode = kCAAnimationLinear;
    [lay addAnimation:k1 forKey:@"SCALE"];
}

-(void)stopAnimation{
    for (CALayer * lay in self.layer.sublayers) {
        [lay removeAllAnimations];
    }
    self.hidden = YES;
}

-(void)awakeFromNib{
    lW = 8;
    [self setLayer];
}
@end
