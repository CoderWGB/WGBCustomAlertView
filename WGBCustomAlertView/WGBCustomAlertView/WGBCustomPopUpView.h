//
//  WGBCustomPopUpView.h
//  WGBCustomAlertView
//
//  Created by 王贵彬 on 2018/1/13.
//  Copyright © 2018年 王贵彬. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WGBAlertAnimationType) {
	WGBAlertAnimationTypeCenter = 0,
	WGBAlertAnimationTypeUp ,
	WGBAlertAnimationTypeBottom,
	WGBAlertAnimationTypeLeft,
	WGBAlertAnimationTypeRight
};

@interface WGBCustomPopUpView : UIView
/// 内容View
@property (strong,nonatomic) UIView *contentView ;
/// default is WGBAlertAnimationTypeCenter  
@property (assign,nonatomic) WGBAlertAnimationType  animationType;
- (void)show;
- (void)dismiss;
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
