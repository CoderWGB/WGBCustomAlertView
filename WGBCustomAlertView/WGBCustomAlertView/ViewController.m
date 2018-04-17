//
//  ViewController.m
//  WGBCustomAlertView
//
//  Created by 王贵彬 on 2018/1/13.
//  Copyright © 2018年 王贵彬. All rights reserved.
//

#import "ViewController.h"
#import "WGBCustomPopUpView.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (strong,nonatomic) WGBCustomPopUpView *popUpView ;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor orangeColor];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(100, 100, 100, 30);
	[button setTitle:@"点我啊!!!" forState:UIControlStateNormal];
	button.backgroundColor = [UIColor whiteColor];
	[self.view addSubview: button];
	[button addTarget:self action:@selector(testDemo) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewDidLayoutSubviews{
	[super viewDidLayoutSubviews];
}

- (void)testDemo{
	[self showDemo];
		//	[self wgbStyle_alertWithTitle:@"提示" cancelButtonTitle:@"取消" confirmButtonTitle:@"确定" cancelAction:^{
		//	} comfirmAction:^{
		//	}];
}

#pragma mark- Demo
- (void)showDemo{
	WGBCustomPopUpView *popUpView = [[WGBCustomPopUpView alloc] init];
	self.popUpView = popUpView;
	// 可视作蒙版
	UIView *bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	bgView.userInteractionEnabled = YES;
	bgView.backgroundColor = [UIColor clearColor] ;

	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.frame = CGRectMake(0,0, 300, 300);
	button.center = CGPointMake(bgView.frame.size.width/2, bgView.frame.size.height/2);
	button.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f];
	[button setTitle:@"你放马过来啊!!!" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
	[bgView addSubview: button];

		///利用runtime关联一个block
	dispatch_block_t block = ^{
		[popUpView dismiss];
	};
	objc_setAssociatedObject(self, @"BlockKey", block, OBJC_ASSOCIATION_COPY_NONATOMIC);

	popUpView.contentView = bgView;
	popUpView.animationType = WGBAlertAnimationTypeCenter;
	popUpView.touchDismiss = NO;
	[popUpView show];
}

#pragma mark- 大标题 左右俩按钮的wgbStyle风格弹窗
- (void)wgbStyle_alertWithTitle:(NSString *)title
							cancelButtonTitle:(NSString *)cancelTitle
						 confirmButtonTitle:(NSString *)confirmTitle
									 cancelAction:(void(^)(void))cancelCallBackBlock
									comfirmAction:(void(^)(void))confirmCompeteBlock {
	CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
//	CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
	WGBCustomPopUpView *popUpView = [[WGBCustomPopUpView alloc] init];
	self.popUpView = popUpView;
	UIView *viewCtrl = [[UIView alloc] init];
	viewCtrl.backgroundColor = [UIColor whiteColor];
	CGFloat rate = (320.0 - 56.0)/320.0;
	CGFloat viewHeight = 178.0;
	viewCtrl.frame = CGRectMake(0, 0, rate * kWidth, viewHeight);
	viewCtrl.layer.cornerRadius = 4;

	UILabel *remindLab = [[UILabel alloc] init];
	NSDictionary *attribute = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18]};
	CGSize retSize = [title boundingRectWithSize: CGSizeMake(viewCtrl.bounds.size.width - 20, HUGE) 	options:\
										NSStringDrawingTruncatesLastVisibleLine |
										NSStringDrawingUsesLineFragmentOrigin |
										NSStringDrawingUsesFontLeading
																		attributes:attribute
																			 context:nil].size;
	CGFloat textHight = retSize.height;
	remindLab.frame = CGRectMake(10, 40, viewCtrl.bounds.size.width - 20, textHight);
	remindLab.text = title;
	remindLab.numberOfLines = 0;
	remindLab.textAlignment = NSTextAlignmentCenter;
	remindLab.font =  [UIFont boldSystemFontOfSize:18];
	[viewCtrl addSubview:remindLab];

	UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
	cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
	cancelButton.frame = CGRectMake(20, CGRectGetMaxY(remindLab.frame) + 40, (viewCtrl.bounds.size.width - 20 * 2 -10) / 2, 36);
	cancelButton.backgroundColor = [UIColor clearColor];
	cancelButton.layer.borderColor =[UIColor lightGrayColor].CGColor;
	cancelButton.layer.borderWidth = 0.9;
	[viewCtrl addSubview:cancelButton];
	[cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
	[cancelButton setTitleColor:[UIColor blueColor]  forState:UIControlStateNormal];
	[cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
	///利用runtime关联一个block
	dispatch_block_t block = ^{
		[popUpView dismiss];
	};
	objc_setAssociatedObject(self, @"BlockKey", block, OBJC_ASSOCIATION_COPY_NONATOMIC);

	cancelButton.layer.cornerRadius = 4;
	UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
	confirmButton.titleLabel.font =  [UIFont systemFontOfSize:15];
	confirmButton.frame = CGRectMake(viewCtrl.bounds.size.width - 20 - cancelButton.bounds.size.width, cancelButton.frame.origin.y, cancelButton.bounds.size.width, cancelButton.bounds.size.height);
	confirmButton.backgroundColor = [UIColor purpleColor];
	[confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
	confirmButton.layer.cornerRadius = 4;
	[confirmButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
	CGRect frame = viewCtrl.frame;
	frame.size.height = CGRectGetMaxY(confirmButton.frame)+20;
	viewCtrl.frame = frame;
	[viewCtrl addSubview: confirmButton];
	popUpView.animationType = WGBAlertAnimationTypeCenter;
	popUpView.contentView = viewCtrl;
	[popUpView show];
}
- (void)dismiss{
//	取出block
	dispatch_block_t  block  =  objc_getAssociatedObject(self, @"BlockKey");
	!block? : block();
}

@end


