#EasyPop.podspec
Pod::Spec.new do |s|
  s.name         = "EasyPop"
  s.version      = "1.0.0"
  s.summary      = "a light weight and easy to use tableview slide effect."

  s.homepage     = "https://github.com/dale454071867/EasyPop"
  s.license      = 'MIT'
  s.author       = { "zhoujie" => "454071867@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/dale454071867/EasyPop.git", :tag => s.version}
  s.source_files  = 'EasyPop/EasyPop/*.{h,m}'
  s.requires_arc = true
end