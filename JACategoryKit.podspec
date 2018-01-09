#
# Be sure to run `pod lib lint JACategoryKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JACategoryKit'
  s.version          = '0.1.0'
  s.summary          = 'JACategoryKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
JACategoryKit 便捷分类库.
                       DESC

  s.homepage         = 'https://github.com/312846421@qq.com/JACategoryKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jacob' => '312846421@qq.com' }
  s.source           = { :git => 'https://github.com/312846421@qq.com/JACategoryKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

# s.source_files = 'JACategoryKit/Classes/**/*'
    s.subspec 'UIView_JAFrame' do |f|
        f.source_files = 'JACategoryKit/Classes/UIView_JAFrame/**/*'
    end

    s.subspec 'UIView_JALayer' do |l|
        l.source_files = 'JACategoryKit/Classes/UIView_JALayer/**/*'
    end

    s.subspec 'UIView_JAUtil' do |u|
        u.source_files = 'JACategoryKit/Classes/UIView_JAUtil/**/*'
        # n.dependency 'AFNetworking'
    end

#  s.resource_bundles = {
#    'JACategoryKit' => ['JACategoryKit/Assets/*']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
