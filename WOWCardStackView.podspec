#
# Be sure to run `pod lib lint WOWCardStackView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WOWCardStackView'
  s.version          = '0.1.0'
  s.summary          = 'Swapable Card Stack View in Swift 3.0.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Swapable Card Stack View in Swift 3.0. It's able to use in Storyboard and similar to UITableView.
                       DESC

  s.homepage         = 'https://github.com/zhouhao27/WOWCardStackView'  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zhou Hao' => 'zhou.hao.27@gmail.com' }
  s.source           = { :git => 'https://github.com/zhouhao27/WOWCardStackView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'WOWCardStackView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WOWCardStackView' => ['WOWCardStackView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
