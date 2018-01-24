# WGBCustomAlertView

[![CI Status](http://img.shields.io/travis/LiPengYue/PYToolBarScrollView.svg?style=flat)](https://travis-ci.org/LiPengYue/PYToolBarScrollView)
[![Version](https://img.shields.io/cocoapods/v/PYToolBarScrollView.svg?style=flat)](http://cocoapods.org/pods/PYToolBarScrollView)
[![License](https://img.shields.io/cocoapods/l/PYToolBarScrollView.svg?style=flat)](http://cocoapods.org/pods/PYToolBarScrollView)
[![Platform](https://img.shields.io/cocoapods/p/PYToolBarScrollView.svg?style=flat)](http://cocoapods.org/pods/PYToolBarScrollView)


[![CI Status](http://img.shields.io/travis/CoderWGB/WGBCustomAlertView.svg?style=flat)](https://travis-ci.org/CoderWGB/WGBCustomAlertView)
[![Version](https://img.shields.io/cocoapods/v/WGBCustomAlertView.svg?style=flat)](http://cocoapods.org/pods/WGBCustomAlertView)
[![License](https://img.shields.io/cocoapods/l/WGBCustomAlertView.svg?style=flat)](http://cocoapods.org/pods/WGBCustomAlertView)
[![Platform](https://img.shields.io/cocoapods/p/WGBCustomAlertView.svg?style=flat)](http://cocoapods.org/pods/WGBCustomAlertView)

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


##### 以上, 结合Demo源码配合食用效果更佳...







