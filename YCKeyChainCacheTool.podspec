
Pod::Spec.new do |s|
  s.name             = "YCKeyChainCacheTool"
  s.version          = "1.0.0"
  s.summary          = "cocoa pod of YCKeyChainCacheTool."

  s.description      = <<-DESC
This is a library about KeyChain,which implement by Objective-C
                       DESC

  s.homepage         = "https://github.com/wenyc/YCKeyChainCacheTool"
  s.license          = 'MIT'
  s.author           = { "wenyc" => "weimeng809@163.com" }
  s.source           = { :git => "https://github.com/wenyc/YCKeyChainCacheTool.git", :tag => s.version }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'YCKeyChainCacheTool/*.{h,m}'

end
