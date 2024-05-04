# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end

target 'APICall' do
  use_frameworks!
  pod 'lottie-ios'
  pod 'SDWebImage'
end
