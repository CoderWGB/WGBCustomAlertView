//
//  WGBCustomPopUpView.m
//  WGBCustomAlertView
//
//  Created by 王贵彬 on 2018/1/13.
//  Copyright © 2018年 王贵彬. All rights reserved.
//

#define kWidth 			[UIScreen mainScreen].bounds.size.width
#define kHeight 			[UIScreen mainScreen].bounds.size.height
#define kWGBAlertAnimationDuration  0.25

#import "WGBCustomPopUpView.h"

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

@implementation UIView (WGBAlertExtra)
- (void)setX:(CGFloat)x
{
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}

- (void)setY:(CGFloat)y
{
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

- (CGFloat)x
{
	return self.frame.origin.x;
}

- (CGFloat)y
{
	return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
	CGPoint center = self.center;
	center.x = centerX;
	self.center = center;
}
- (CGFloat)centerX
{
	return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
	CGPoint center = self.center;
	center.y = centerY;
	self.center = center;
}
- (CGFloat)centerY
{
	return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}
- (void)setHeight:(CGFloat)height
{
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

- (CGFloat)height
{
	return self.frame.size.height;
}

- (CGFloat)width
{
	return self.frame.size.width;
}
- (void)setSize:(CGSize)size
{
	CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

- (CGSize)size
{
	return self.frame.size;
}
- (void)setOrigin:(CGPoint)origin
{
	CGRect frame = self.frame;
	frame.origin = origin;
	self.frame = frame;
}
- (CGPoint)origin
{
	return self.frame.origin;
}
@end


@interface WGBCustomPopUpView ()

@end

@implementation WGBCustomPopUpView

- (instancetype)init{
	if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {

	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	frame = [UIScreen mainScreen].bounds; //不管你外面怎么设置 我都是全屏的 (常规操作)
	self = [super initWithFrame:frame];
	if (self) {
		/// 初始化配置
		self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.45];
	}
	return self;
}


/// 添加内容视图
- (void)setContentView:(UIView *)contentView{
	_contentView = contentView;
	[self addSubview: contentView];
}

	/// 设置动画弹出的类型 初始化内容视图的frame 根据不同类型作动画处理
- (void)setAnimationType:(WGBAlertAnimationType)animationType{
	_animationType = animationType;
}

- (void)setTouchDismiss:(BOOL)touchDismiss{
	_touchDismiss = touchDismiss;
	if (touchDismiss) {
		self.userInteractionEnabled = YES;
		UITapGestureRecognizer *tap = [ [UITapGestureRecognizer alloc]  initWithTarget:self action:@selector(touchDismissAction)];
		[self addGestureRecognizer: tap];
	}
}

- (void)touchDismissAction{
	[self dismiss];
}

	///MARK:- 初始化内容视图的位置
- (void)initContentViewFrameWithAnimationType:(WGBAlertAnimationType )animationType{
	CGPoint center =  CGPointMake(kWidth/2.0, kHeight/2.0);
	self.contentView.center = center;
	CGFloat viewX  = self.contentView.x;
	CGFloat viewY  = self.contentView.y;
	CGFloat viewW  = self.contentView.width;
	CGFloat viewH = self.contentView.height;

	switch (animationType) {
		case WGBAlertAnimationTypeCenter:{
			self.contentView.center = center;
		}
			break;
		case WGBAlertAnimationTypeUp:{
				// 初始化在屏幕上方看不见🙈的位置
			viewY  = - viewH;
			self.contentView.frame = CGRectMake(viewX, viewY, viewW, viewH);
		}
			break;
		case WGBAlertAnimationTypeBottom:{
				// 初始化在屏幕下方看不见🙈的位置
			viewY  =  kHeight ;
			self.contentView.frame = CGRectMake(viewX, viewY, viewW, viewH);
		}
			break;
		case WGBAlertAnimationTypeLeft:{
				// 初始化在屏幕左方看不见🙈的位置
			viewX  =  -viewW ;
			self.contentView.frame = CGRectMake(viewX, viewY, viewW, viewH);
		}
			break;
		case WGBAlertAnimationTypeRight:{
				// 初始化在屏幕右方看不见🙈的位置
			viewX  =  kWidth  ;
			self.contentView.frame = CGRectMake(viewX, viewY, viewW, viewH);
		}
			break;
			case WGBAlertAnimationTypeAlert:{
				viewY = kHeight;
				self.contentView.frame = CGRectMake(viewX, viewY, viewW , viewH);
			}
			break;
		default:{
			self.contentView.center = center;
		}
			break;
	}
}

	///MARK:- 从中心弹出的动画
- (void)showAlertCenterScaleAnimation{
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	animation.fromValue = @0;
	animation.toValue = @1;
	animation.duration = kWGBAlertAnimationDuration;
	animation.removedOnCompletion =YES;
	animation.fillMode = kCAFillModeForwards;
	[self.contentView.layer addAnimation: animation forKey:nil];
}
	///MARK:- 从中心弹出的动画
- (void)dismissAlertCenterScaleAnimation{
	[UIView animateWithDuration:kWGBAlertAnimationDuration animations:^{
		self.contentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
	} completion:^(BOOL finished) {
		[self removeFromSuperview];
	}];
}

- (void)show{
	[self initContentViewFrameWithAnimationType: self.animationType];
	[self showBackground]; // 蒙版
__block	CGPoint center =  CGPointMake(kWidth/2.0, kHeight/2.0);
	switch (self.animationType) {
		case WGBAlertAnimationTypeCenter:{
			[self showAlertCenterScaleAnimation];
		}
			break;
		case WGBAlertAnimationTypeUp:{
			[UIView animateWithDuration:kWGBAlertAnimationDuration animations:^{
				self.contentView.center = center;
			} completion:^(BOOL finished) {
			}];
		}
			break;
		case WGBAlertAnimationTypeBottom:{
			[UIView animateWithDuration:kWGBAlertAnimationDuration animations:^{
				self.contentView.center = center;
			} completion:^(BOOL finished) {
			}];
		}
			break;
		case WGBAlertAnimationTypeLeft:{
			[UIView animateWithDuration:kWGBAlertAnimationDuration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:0 options:(UIViewAnimationOptionLayoutSubviews) animations:^{
				self.contentView.center = center;
			} completion:^(BOOL finished) {
			}];
		}
			break;
		case WGBAlertAnimationTypeRight:{
			[UIView animateWithDuration:kWGBAlertAnimationDuration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:0 options:(UIViewAnimationOptionLayoutSubviews) animations:^{
				self.contentView.center = center;
			} completion:^(BOOL finished) {
			}];
		}
			break;
			case WGBAlertAnimationTypeAlert:{
				UIWindow *window = [[UIApplication sharedApplication] keyWindow];
				window.userInteractionEnabled = NO;
				self.contentView.alpha = 0;
				self.contentView.transform = CGAffineTransformMakeScale(1.2, 1.2);
				[UIView animateWithDuration:kWGBAlertAnimationDuration animations:^{
					CGRect frame = self.contentView.frame;
					frame.origin.y -= kHeight;
					self.contentView.frame = frame;
					self.contentView.alpha = 1.0;
					self.contentView.transform = CGAffineTransformIdentity;
				} completion:^(BOOL finished) {
					UIWindow *window = [[UIApplication sharedApplication] keyWindow];
					window.userInteractionEnabled = YES;
				}];
			}
			break;
		default:{
			[self showAlertCenterScaleAnimation];
		}
			break;
	}
}

- (void)dismiss{
	/// 动画原则是操作contentView的frame
	__block	CGFloat viewW  = self.contentView.width;
	__block	CGFloat viewH = self.contentView.height;
	switch (self.animationType) {
		case WGBAlertAnimationTypeCenter:{
			[self dismissAlertCenterScaleAnimation];
		}
			break;
		case WGBAlertAnimationTypeUp:{
			[UIView animateWithDuration:kWGBAlertAnimationDuration animations:^{
				self.contentView.y = -viewH;
			} completion:^(BOOL finished) {
				[self removeFromSuperview];
			}];
		}
			break;
		case WGBAlertAnimationTypeBottom:{
			[UIView animateWithDuration:kWGBAlertAnimationDuration animations:^{
				self.contentView.y = kHeight;
			} completion:^(BOOL finished) {
				[self removeFromSuperview];
			}];
		}
			break;
		case WGBAlertAnimationTypeLeft:{
			[UIView animateWithDuration:kWGBAlertAnimationDuration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:0 options:(UIViewAnimationOptionLayoutSubviews) animations:^{
				self.contentView.x =  -viewW;
			} completion:^(BOOL finished) {
				[self removeFromSuperview];
			}];
		}
			break;
		case WGBAlertAnimationTypeRight:{
			[UIView animateWithDuration:kWGBAlertAnimationDuration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:0 options:(UIViewAnimationOptionLayoutSubviews) animations:^{
				self.contentView.x = kWidth;
			} completion:^(BOOL finished) {
				[self removeFromSuperview];
			}];
		}
			break;
			case WGBAlertAnimationTypeAlert:{
				UIWindow *window = [[UIApplication sharedApplication] keyWindow];
				window.userInteractionEnabled = NO;
				[UIView animateWithDuration:kWGBAlertAnimationDuration animations:^{
					CGRect frame = self.contentView.frame;
					frame.origin.y += kHeight;
					self.contentView.frame = frame;
					self.contentView.transform = CGAffineTransformMakeScale(0.8, 0.8);
					self.contentView.alpha = 0 ;
					self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent: 0];
				} completion:^(BOOL finished) {
					UIWindow *window = [[UIApplication sharedApplication] keyWindow];
					window.userInteractionEnabled = YES;
					[self removeFromSuperview];
				}];
			}
			break;
		default:{
			[self dismissAlertCenterScaleAnimation];
		}
			break;
	}
}

/// 加蒙版视图动画
- (void)showBackground{
	UIWindow *window = [[UIApplication sharedApplication] keyWindow];
	self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.45];
	[window addSubview: self];
}

@end


@interface WGBAlertViewController()
/*!
 @property
 @abstract 展示内容控制器
 */
@property (nonatomic,strong,readwrite) UIViewController *contentViewController;

@end

@implementation WGBAlertViewController

- (instancetype)initWithContentViewController:(UIViewController *)contentViewController{
    self = [super init];
    if (self) {
        self.contentViewController = contentViewController;
    }
    return self;
}

- (void)setContentViewController:(UIViewController *)contentViewController{
    _contentViewController = contentViewController;
    _contentViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
}

- (void)setIsMask:(BOOL)isMask{
    _isMask = isMask;
    if (_isMask) {
        self.contentViewController.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.45];
    }
}

- (void)show{
    [self isMask];
    [[self topViewController] presentViewController: self.contentViewController animated:YES completion:^{
        
    }];
}

- (void)dismiss{
    [self.contentViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
}

@end
