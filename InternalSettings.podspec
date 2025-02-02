#
# Be sure to run `pod lib lint InternalSettings.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InternalSettings'
  s.version          = '0.1.0'
  s.summary          = 'Very basic scaffolding for the internal settings view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/gontovnik/InternalSettings'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gontovnik' => 'danil@gontovnik.com' }
  s.source           = { :git => 'https://github.com/gontovnik/InternalSettings.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/gontovnik'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'
  s.source_files = 'InternalSettings/Classes/**/*'
  s.frameworks = 'UIKit'
end
