Pod::Spec.new do |s|
  s.name = "AcrosureSDK"
  s.version = "1.0.4"
  s.summary = "Swift SDK for connecting with Acrosure Insurance Gateway."
  s.license = 'MIT'
  s.homepage = 'https://acrosure.com'
  s.author = { "Acrosure Co., Ltd." => "dev@acrosure.com" }
  s.source = { :git => "https://github.com/Acrosure/acrosure-swift-sdk.git", :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'

  s.source_files = 'AcrosureSDK/*.swift'
  s.dependency 'Alamofire', '~> 4.7'
  s.dependency 'SwiftyJSON', '~> 4.0'
end
