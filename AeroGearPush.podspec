Pod::Spec.new do |s|
  s.name         = "AeroGearPush"
  s.version      = "2.0.0-Sherpa"
  s.summary      = "AeroGear UnifiedPush Client Registration SDK."
  s.homepage     = "https://github.com/aerogear/aerogear-ios-push-objc"
  s.license      = 'Apache License, Version 2.0'
  s.author       = "Red Hat, Inc."
  s.source       = { :git => 'https://github.com/aerogear/aerogear-ios-push-objc.git', :tag => s.version }
  s.platform     = :ios, 9.0
  s.source_files = 'AeroGearPush/**/*.{h,m}'
  s.public_header_files = 'AeroGearPush/AeroGearPush.h', 'AeroGearPush/AGDeviceRegistration.h', 'AeroGearPush/AGClientDeviceInformation.h', 'AeroGearPush/AGPushAnalytics.h'
  s.requires_arc = true
end
