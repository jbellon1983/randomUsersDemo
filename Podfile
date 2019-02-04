# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'Moya/RxSwift', '~> 12.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'RealmSwift'
  pod 'Swinject'
  pod 'SVProgressHUD'
  pod 'SDWebImage', '~> 4.0'
end

target 'randomusersDemo' do
  platform :ios, '9.0'
  use_frameworks!
  # Pods for randomusersDemo
  common_pods
end

target 'randomusersDemoTests' do
  platform :ios, '9.0'
  use_frameworks!
  # Pods for testing
  common_pods
  pod 'SwiftyMocky'
end
