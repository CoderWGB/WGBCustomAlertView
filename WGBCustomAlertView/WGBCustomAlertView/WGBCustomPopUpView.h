//
//  WGBCustomPopUpView.h
//  WGBCustomAlertView
//
//  Created by 王贵彬 on 2018/1/13.
//  Copyright © 2018年 王贵彬. All rights reserved.
//
#import <UIKit/UIKit.h>

/// 暂时想到这点简陋的动画 后续拓展 持续更新吧~
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
@property (assign,nonatomic) BOOL touchDismiss; //是否点击背景移除 默认否

- (void)show; //弹
- (void)dismiss;//消失
@end

