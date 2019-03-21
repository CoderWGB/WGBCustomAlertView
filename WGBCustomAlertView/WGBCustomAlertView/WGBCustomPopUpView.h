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
	WGBAlertAnimationTypeRight,//从右边弹出
	WGBAlertAnimationTypeAlert //类似系统弹出窗动画
};

@interface WGBCustomPopUpView : UIView
/*!
 @property
 @abstract 展示内容的视图view
 */
@property (strong,nonatomic) UIView *contentView ;
/*!
 @property
 @abstract 弹出动画类型 Default type is WGBAlertAnimationTypeCenter
 */
@property (assign,nonatomic) WGBAlertAnimationType  animationType;
/*!
 @property
 @abstract 是否点击背景移除 默认否 the background layer dismiss. Default is NO
 */
@property (assign,nonatomic) BOOL touchDismiss;
/**  蒙层的透明度 默认 0.45  maskLayer's backgroundColor alpha, default is 0.45*/
@property (nonatomic,assign) CGFloat maskLayerAlpha;

/*!
 @method 展示到window上
 @abstract show a alert on keywindow or rootView
 @discussion 这个方法必须实现,不然看不见任何效果
 */
- (void)show;
/*!
 @method 移除弹窗视图
 @abstract remove alert layer from superView
 */
- (void)dismiss;//消失
@end


@interface WGBAlertViewController : UIViewController

#pragma mark - 指定实例化方法
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil __attribute__((unavailable("initWithNibName:bundle:方法不可用,请用 initWithContentViewController:")));

- (instancetype)init __attribute__((unavailable("init方法不可用,请用 initWithContentViewController:")));

/*!
 @method 构造方法
 @property 内容控制器
 @abstract 通过外部传入一个控制器 用于展示
 @discussion 这个控制器是必传的 也就是展示的View放在这个控制器上
 @result 实例化一个弹窗控制器对象
 */
- (instancetype)initWithContentViewController:(UIViewController *)contentViewController;
/*!
 @property
 @abstract 展示内容控制器
 */
@property (nonatomic,strong,readonly) UIViewController *contentViewController;
/*!
 @property
 @abstract 是否需要蒙层 默认NO 其实就是设置传入的控制器的view的背景色(可自定义) 默认是黑色 alpha 0.45 
 */
@property (nonatomic,assign) BOOL isMask;

///MARK:- 弹出一个窗
- (void)show;
///MARK:- 消除弹出窗
- (void)dismiss;

@end
