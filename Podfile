# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
# use_frameworks!

target ‘HackatonApp’ do
  use_frameworks!
  pod 'Segmentio', '2.0'
	pod 'AFNetworking', '~> 2.6.3'
	pod 'GoogleMaps'
	pod 'StretchHeader', '1.1'
	
	 post_install do |installer|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end
	
end

