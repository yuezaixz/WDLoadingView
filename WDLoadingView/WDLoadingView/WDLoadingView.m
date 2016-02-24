//
//  WDLoadingView.m
//  Runmove
//
//  Created by 吴迪玮 on 16/2/24.
//  Copyright © 2016年 Maytaste. All rights reserved.
//

#import "WDLoadingView.h"

#define CIRCLE_LOADING_DURAING 0.3

@interface WDLoadingView()

@property (nonatomic) CGFloat circlePadding;
@property (nonatomic) CGFloat viewLength;

@end

@implementation WDLoadingView{
    NSTimer *animationTimer;
}

- (instancetype)initWithFrame:(CGRect)frame circleCount:(NSInteger)circleCount
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circleCount = circleCount;
        CGFloat viewWidth = CGRectGetWidth(self.frame);
        CGFloat viewHeight = CGRectGetHeight(self.frame);
        self.isLandcape = viewWidth >= viewHeight;
        self.radius = MIN(viewHeight, viewWidth);
        self.viewLength = MAX(viewHeight, viewWidth);
        [self drawLoadingView];
    }
    return self;
}

- (void)drawLoadingView {
    self.circlePadding = self.viewLength/self.circleCount - self.radius;
    
    self.currentIndex = 0;
    [self.loadingViews enumerateObjectsUsingBlock:^(UIView *item, NSUInteger idx, BOOL * _Nonnull stop) {
        [item removeFromSuperview];
    }];
    self.loadingViews = nil;
    
    self.loadingViews = ({
        NSMutableArray *loadingViews = [NSMutableArray array];
        
        for (int i = 0; i<self.circleCount; i++) {
            CGRect circleFrame = self.isLandcape?CGRectMake(i*self.radius + i*self.circlePadding, 0, self.radius, self.radius):CGRectMake(0, i*self.radius + i*self.circlePadding, self.radius, self.radius);
            UIView *circleView = [[UIView alloc] initWithFrame:circleFrame];
            circleView.layer.cornerRadius = self.radius/2;
            circleView.layer.masksToBounds = YES;
            circleView.backgroundColor = self.circleColor;
            circleView.alpha = (float)(i+1)/self.circleCount;
            [loadingViews addObject:circleView];
            [self addSubview:circleView];
        }
        
        [loadingViews copy];
    });
}

- (void)startAnimation {
    if (!animationTimer) {
        // 创建
        animationTimer = [NSTimer scheduledTimerWithTimeInterval:CIRCLE_LOADING_DURAING
                                                        target:self
                                                      selector:@selector(animationCircle)
                                                      userInfo:nil
                                                       repeats:YES];
        
    }
}

- (void)stopAnimation {
    [animationTimer invalidate];
    animationTimer = nil;
    [self.loadingViews enumerateObjectsUsingBlock:^(UIView *item, NSUInteger idx, BOOL * _Nonnull stop) {
        item.alpha = (float)(idx+1)/self.circleCount;
    }];
}

- (void)animationCircle {
    self.currentIndex = (self.currentIndex+1) % (int)self.circleCount;
    [self.loadingViews enumerateObjectsUsingBlock:^(UIView *item, NSUInteger idx, BOOL * _Nonnull stop) {
        if (item.alpha == 1) {
            item.alpha = 0;
        }
        item.alpha = idx == (self.circleCount - self.currentIndex-1)?1:(item.alpha + 1.0/self.circleCount);
        NSLog(@"%ld,%f",idx,item.alpha);
    }];
}

-(UIColor *)circleColor{
    if (!_circleColor) {
        _circleColor = [UIColor colorWithRed:233.0/255 green:85.0/255 blue:19.0/255 alpha:1];
    }
    return _circleColor;
}

@end
