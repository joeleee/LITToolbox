Pod::Spec.new do |s|

  s.name         = "LITToolbox"
  s.version      = "0.1.0"
  s.summary      = "Some useful additions and toolClass for iOS UIKit&Foundation library."
  s.description  = "Some useful additions and toolClass for iOS UIKit&Foundation library. To be a lazy programmer, let us take a supplement it, make a better world to programmer. 一起来补充，让程序员的世界更美好！"
  s.homepage     = "https://github.com/zhuocheng/LITToolbox"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author           = { "李卓成" => "zhuocheng.lee@gmail.com" }
  s.social_media_url = "http://www.renren.com/428049345/profile"

  s.platform              = :ios, '6.0'
  s.ios.deployment_target = '6.0'

  s.source       = { :git => "https://github.com/zhuocheng/LITToolbox.git", :tag => "v0.1.0" }
  s.source_files = 'sourceFiles/*'
  s.requires_arc = true

end
