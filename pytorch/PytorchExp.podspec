Pod::Spec.new do |s|
    s.name             = 'PytorchExp'
    s.version          = '0.0.1'
    s.authors          = 'xta0'
    s.license          = { :type => 'MIT' }
    s.homepage         = 'https://github.com/xta0/Pytorch-iOS'
    s.source           = { :git => 'https://github.com/xta0/Pytorch-iOS.git', :branch => "master" }
    s.summary          = 'Pytorch experimental Cocoapods'
    s.description      = <<-DESC
    An internal-only pod containing the Pytorch C++ code for iOS. This pod is not
    intended to be used directly.
    DESC

    s.ios.deployment_target = '10.3'
    s.default_subspec = 'Core'
    
    s.subspec 'Core' do |ss|
        ss.dependency 'ios/PytorchExp/Libtorch'
        ss.source_files = 'ios/src/*.{h,cpp,cc}'
        ss.public_header_files = ['ios/src/PytorchExp.h']
    end
    
    s.subspec 'Libtorch' do |ss|
        ss.header_mappings_dir = 'ios/install/include/'
        ss.preserve_paths = 'ios/install/include/**/*.{h,cpp,cc,c}'   
        ss.pod_target_xcconfig = { 
            'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/ios/PytorchExp/install/include/"', 
            'VALID_ARCHS' => 'armv7 armv7s arm64'
        }
        ss.vendored_libraries = 'ios/install/lib/libtorch.a'
        ss.libraries = 'c++', 'stdc++'
    end
    
    s.user_target_xcconfig = {
        'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/ios/PytorchExp/install/lib/libtorch.a"',
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
        'CLANG_CXX_LIBRARY' => 'libc++'
    }
    s.module_name='PytorchExp'
    s.library = 'c++', 'stdc++'
end
