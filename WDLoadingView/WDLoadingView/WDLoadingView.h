//
//  WDLoadingView.h
//  Runmove
//
//  Created by 吴迪玮 on 16/2/24.
//  Copyright © 2016年 Maytaste. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDLoadingView : UIView

@property (nonatomic) NSInteger circleCount;
@property (nonatomic) BOOL isLandcape;
@property (nonatomic) CGFloat radius;

@property (nonatomic) NSInteger currentIndex;
@property (strong, nonatomic) NSArray *loadingViews;

@property (strong, nonatomic) UIColor *circleColor;

- (instancetype)initWithFrame:(CGRect)frame circleCount:(NSInteger)circleCount;

- (void)drawLoadingView;
- (void)startAnimation;
- (void)stopAnimation;

@end
