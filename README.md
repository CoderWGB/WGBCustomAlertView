# WGBCustomAlertView
自定义弹窗视图

支持pod私有库的引入

```swift
source "https://github.com/CoderWGB/WGBSpec.git" 
#以上这句必须填写 不然找不到这个库是从哪里加载过来的
platform :ios,'8.0'
target "WGB_MyDemoApp" do 
pod 'WGBCustomAlertPopupView','0.0.1'
end

```

当然也要支持cocopods啦!

```ruby

pod 'WGBCustomAlertPopupView','~>0.0.1'

```


## 三行代码 搞定一个弹窗 

### "Talk is cheap show me your code !"

首先引入头文件 `#import "WGBCustomPopUpView.h"`

```swift	
	//实例化	
  	WGBCustomPopUpView *popUpView = [[WGBCustomPopUpView alloc] init];
  	self.popUpView = popUpView; //持有对象,以便于dismiss 这里真正使用时再另行封装利用block转发更加优雅些

  	//创建个按钮试试水
  	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.frame = CGRectMake(0, 0, 300, 300);
	button.backgroundColor = [UIColor magentaColor];
	[button setTitle:@"你放马过来啊!!!" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];

	/// 以下三行才是关键代码 
  	popUpView.contentView = button;  //设置内容视图
  	popUpView.animationType = arc4random()%5;  //设置弹窗动画类型  
  	[popUpView show]; // 弹出来瞧瞧


 - (void)dismiss{
	[self.popUpView dismiss];
}

```

### 自定义"骚"操作 定制个性化Style的弹窗

```swift
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
	[cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];// cancelCallBackBlock
	cancelButton.layer.cornerRadius = 4;

	UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
	confirmButton.titleLabel.font =  [UIFont systemFontOfSize:15];
	confirmButton.frame = CGRectMake(viewCtrl.bounds.size.width - 20 - cancelButton.bounds.size.width, cancelButton.frame.origin.y, cancelButton.bounds.size.width, cancelButton.bounds.size.height);
	confirmButton.backgroundColor = [UIColor purpleColor];
	[confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
	confirmButton.layer.cornerRadius = 4;
	[confirmButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside]; //confirmCompeteBlock
	CGRect frame = viewCtrl.frame;
	frame.size.height = CGRectGetMaxY(confirmButton.frame)+20;
	viewCtrl.frame = frame;
	[viewCtrl addSubview: confirmButton];
	popUpView.animationType = WGBAlertAnimationTypeCenter;
	popUpView.contentView = viewCtrl;
	[popUpView show];
}


- (void)dismiss{
	[self.popUpView dismiss];
}

```

##### 以上, 结合Demo源码配合食用效果更佳哦😯







