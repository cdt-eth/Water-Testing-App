
target 'Water Testing' do

  use_frameworks!


pod 'FloatingLabelTextFieldSwiftUI'


############ FIREBASE POD ############
# add the Firebase pod for Google Analytics
pod 'Firebase/Analytics'
# add pods for any other desired Firebase products
# https://firebase.google.com/docs/ios/setup#available-pods

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end




  target 'Water TestingTests' do
    inherit! :search_paths

  end

  target 'Water TestingUITests' do

  end

end
