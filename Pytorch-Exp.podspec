Pod::Spec.new do |s|
    s.name             = 'Pytorch-Exp'
    s.version          = '0.0.7'
    s.authors          = 'xta0'
    s.license          = { :type => 'MIT' }
    s.homepage         = 'https://github.com/xta0/Pytorch-iOS'
    s.source           = { :git => 'https://github.com/xta0/Pytorch-iOS.git', :branch => "framework" }
    s.summary          = 'Pytorch experimental Cocoapods'
    s.description      = <<-DESC
    An internal-only pod containing the Pytorch C++ code for iOS. This pod is not
    intended to be used directly.
    DESC

    s.ios.deployment_target = '10.3'
    s.module_name='PytorchExp'
    s.header_mappings_dir = 'install/PytorchExp.framework/Headers/include/'
    s.preserve_paths = 'install/PytorchExp.framework/Headers/include/**/*.{h,cpp,cc,c}'  
    s.pod_target_xcconfig = { 
            'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Pytorch-Exp/install/PytorchExp.framework/Headers/include/"', 
            'VALID_ARCHS' => 'armv7 armv7s arm64'
        }
    s.user_target_xcconfig = {
        'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/Pytorch-Exp/install/PytorchExp.framework/libtorch"',
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
        'CLANG_CXX_LIBRARY' => 'libc++'
    }
    s.vendored_frameworks = 'install/PytorchExp.framework'
    s.library = 'c++', 'stdc++'
    
    
end
