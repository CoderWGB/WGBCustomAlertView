# WGBCustomAlertView

[![Version](https://img.shields.io/cocoapods/v/WGBCustomAlertPopupView.svg?style=flat)](http://cocoapods.org/pods/WGBCustomAlertPopupView)
[![License](https://img.shields.io/cocoapods/l/WGBCustomAlertPopupView.svg?style=flat)](http://cocoapods.org/pods/WGBCustomAlertPopupView)
[![Platform](https://img.shields.io/cocoapods/p/WGBCustomAlertPopupView.svg?style=flat)](http://cocoapods.org/pods/WGBCustomAlertPopupView)



自定义弹窗视图

支持pod私有库的引入

```swift

pod 'WGBCustomAlertPopupView'


```



## 三行代码 搞定一个弹窗 

### "Talk is cheap show me your code !"

首先引入头文件 `#import "WGBCustomPopUpView.h"`

```swift	
	//实例化	
  	WGBCustomPopUpView *popUpView = [[WGBCustomPopUpView alloc] init];
  	
	UIView *bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	bgView.userInteractionEnabled = YES;
	bgView.backgroundColor = [UIColor clearColor] ;

  	UIView *redView = [[UIView alloc] init];
  	redView.frame = CGRectMake(0,kScreenHeight-200,375,200);
  	redView.backgroundColor =[UIColor redColor];
	redView.center = CGPointMake(bgView.frame.size.width/2, bgView.frame.size.height/2);
	[bgView addSubview: redView];


	/// 以下三行才是关键代码 
  	popUpView.contentView = redView;  //设置内容视图
  	popUpView.animationType = arc4random()%6;  //设置弹窗动画类型  随机枚举值  
  	[popUpView show]; // 弹出来瞧瞧

  	// 必要的时候消除弹窗
  		popUpView.touchDismiss = YES;
  		[popUpView dismiss];
 

```


##### 以上...







