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
        ss.dependency 'PytorchExp/Libtorch'
        ss.source_files = 'src/*.{h,cpp,cc}'
        ss.public_header_files = ['src/PytorchExp.h']
    end
    
    s.subspec 'Libtorch' do |ss|
        ss.header_mappings_dir = 'install/include/'
        ss.preserve_paths = 'install/include/**/*.{h,cpp,cc,c}' 
        ss.vendored_libraries = 'install/lib/libtorch.a'
        ss.libraries = 'c++', 'stdc++',
        ss.pod_target_xcconfig = { 'VALID_ARCHS' => 'armv7 armv7s arm64' }
    end
    
    s.user_target_xcconfig = {
        'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/PytorchExp/install/include/"', 
        'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/PytorchExp/install/lib/libtorch.a"',
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
        'CLANG_CXX_LIBRARY' => 'libc++'
    }
    s.static_framework = true
    s.module_name='PytorchExp'
    s.library = 'c++', 'stdc++'
end
