//
//  WGBCustomPopUpView.h
//  WGBCustomAlertView
//
//  Created by 王贵彬 on 2018/1/13.
//  Copyright © 2018年 王贵彬. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WGBAlertAnimationType) {
	WGBAlertAnimationTypeCenter = 0, //从中心弹出
	WGBAlertAnimationTypeUp ,//从顶部弹出
	WGBAlertAnimationTypeBottom,//从底部弹出
	WGBAlertAnimationTypeLeft,//从左边弹出
	WGBAlertAnimationTypeRight//从右边弹出
};

@interface WGBCustomPopUpView : UIView
/// 内容View
@property (strong,nonatomic) UIView *contentView ;
/// default is WGBAlertAnimationTypeCenter   弹出动画类型
@property (assign,nonatomic) WGBAlertAnimationType  animationType;
- (void)show; //弹
- (void)dismiss;//消失
@end

@interface UIView (WGBAlertExtra)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@end
