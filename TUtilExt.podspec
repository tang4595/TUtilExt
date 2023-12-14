$version = "0.0.1"

Pod::Spec.new do |s|
  s.name         = "TUtilExt" 
  s.version      = $version
  s.summary      = "TUtilExt."
  s.description  = "TUtilExt."
  s.homepage     = "https://www.apple.com"
  
  s.license      = "MIT"
  s.author       = { "tang" => "tang@apple.com" }
  s.source       = { :git => "https://github.com/tang4595/", :tag => $version }
  s.source_files = "TUtilExt/Classes/**/*"
  s.resource_bundles = {
    'TUtilExtResource' => ['TUtilExt/Assets/*.{xcassets,json,plist}']
  }

  s.dependency 'SnapKit'
  s.dependency 'SwifterSwift'
  s.dependency 'CryptoSwift'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'MJRefresh'
  s.dependency 'TPKeyboardAvoiding'
  s.dependency 'RTRootNavigationController'
  s.dependency 'TAppBase'

  s.platform = :ios, "11.0"
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4']
  s.pod_target_xcconfig = { 'c' => '-Owholemodule' }
end

