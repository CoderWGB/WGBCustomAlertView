Pod::Spec.new do |s|


  s.name         = "WGBCustomAlertPopupView"
  s.version      = "1.0.2"
  s.summary      = "高度定制化的自定义弹窗小组件,提供上下左右中心各种位置的弹窗动画,能够应对基本的业务开发"

  s.description  = <<-DESC 
  方便快捷,耦合性低,复用性高,持续更新,敬请关注. 支持自定义view和自定义controller的简单弹出展示    
                   DESC

  s.homepage     = "https://github.com/CoderWGB/WGBCustomAlertView"
  
  s.license      = "MIT"
  

  s.author             = { "wangguibin" => "wangguibin1993@gmail.com" }
 
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/CoderWGB/WGBCustomAlertView.git", :tag => "#{s.version}" }


  s.source_files  = "WGBCustomAlertView", "WGBCustomAlertView/**/WGBCustomPopUpView.{h,m}"
  
  s.requires_arc = true


end
