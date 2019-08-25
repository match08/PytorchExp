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
    s.header_mappings_dir = 'Frameworks/PytorchExp.framework/Headers/'
    s.preserve_paths = 'Frameworks/PytorchExp.framework/Headers/**/*.{h,cpp,cc,c}'  
    # s.public_header_files = ['Frameworks/PytorchExp.framework/Headers/PytorchExp.h', 'Frameworks/PytorchExp.framework/Headers/PytorchExp_c_api.h']
    s.pod_target_xcconfig = { 
            'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Pytorch-Exp/Frameworks/PytorchExp.framework/Headers/" "$(PODS_ROOT)/Pytorch-Exp/Frameworks/PytorchExp.framework/PrivateHeaders/"', 
            'VALID_ARCHS' => 'armv7 armv7s arm64'
        }
    s.user_target_xcconfig = {
        'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/Pytorch-Exp/Frameworks/PytorchExp.framework/Frameworks/PyTorchExp"',
        'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
        'CLANG_CXX_LIBRARY' => 'libc++'
    }
    s.vendored_frameworks = 'Frameworks/PytorchExp.framework'
    s.library = 'c++', 'stdc++'
    
    
end
