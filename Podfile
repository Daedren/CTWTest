# Uncomment the next line to define a global platform for your project
platform :ios, '12.2'
#
def shared_pods
    pod 'RxSwift', '~> 5'
    pod 'RxCocoa' , '~> 5'
    pod 'RxRelay', '~> 5'
    pod 'SwiftLint', '0.34.0'
    pod 'Swinject', '~> 2.6.0'
end

def testing_pods
    pod 'Swinject', '~> 2.6.0'
    pod 'RxTest','~> 5'
    pod 'RxBlocking', '~> 5'
    pod 'Cuckoo', '1.1.1'
end


target 'ctwTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ctwTest
  shared_pods
  pod 'R.swift'

  target 'ctwTestTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

end

target 'ctwTest-Domain' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ctwTest-Domain
  shared_pods

  target 'ctwTest-DomainTests' do
    # Pods for testing
    testing_pods
  end

end

target 'ctwTest-Data' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for ctwTest-Domain
  shared_pods
  
  target 'ctwTest-DataTests' do
    # Pods for testing
    testing_pods
  end
  
end
