Pod::Spec.new do |s|
    s.name             = 'PytorchExp'
    # s.name             = 'TensorFlowLiteC'
    s.version          = '1.14.0'
    s.authors          = 'Google Inc.'
    s.license          = { :type => 'Apache' }
    s.homepage         = 'https://github.com/tensorflow/tensorflow'
    s.source           = { :http => "https://dl.google.com/dl/cpdc/0e27bc28472e2519/TensorFlowLiteC-#{s.version}.tar.gz" }
    s.summary          = 'TensorFlow Lite'
    s.description      = <<-DESC
    An internal-only pod containing the TensorFlow Lite C library that the public
    `TensorFlowLiteSwift` and `TensorFlowLiteObjC` pods depend on. This pod is not
    intended to be used directly. Swift developers should use the
    `TensorFlowLiteSwift` pod and Objective-C developers should use the
    `TensorFlowLiteObjC` pod.
                         DESC
  
    s.ios.deployment_target = '9.0'
  
    s.module_name = 'TensorFlowLiteC'
    s.library = 'c++'
    s.vendored_frameworks = 'Frameworks/TensorFlowLiteC.framework'
    # s.version          = '0.0.1'
    # s.authors          = 'xta0'
    # s.license          = { :type => 'MIT' }
    # s.homepage         = 'https://github.com/xta0/Pytorch-iOS'
    # s.source           = { :http => 'https://xta0.me/resource/libtorch.zip' }
    # s.summary          = 'Pytorch experimental Cocoapods'
    # s.description      = <<-DESC
    # An internal-only pod containing the Pytorch C++ code for iOS. This pod is not
    # intended to be used directly.
    # DESC

    # s.ios.deployment_target = '10.3'
    # s.default_subspec = 'Core'
    
    # s.subspec 'Core' do |ss|
    #     ss.dependency 'PytorchExp/Libtorch'
    #     ss.source_files = 'src/*.{h,cpp,cc}'
    #     ss.public_header_files = ['src/PytorchExp.h']
    # end
    
    # s.subspec 'Libtorch' do |ss|
    #     ss.header_mappings_dir = 'install/include/'
    #     ss.preserve_paths = 'install/include/**/*.{h,cpp,cc,c}' 
    #     ss.vendored_libraries = 'install/lib/libtorch.a'
    #     ss.libraries = ['c++', 'stdc++']
    # end
    # s.user_target_xcconfig = {
    #     'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/PytorchExp/install/lib/libtorch.a"',
    #     'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
    #     'CLANG_CXX_LIBRARY' => 'libc++'
    # }
    # s.pod_target_xcconfig = { 
    #     'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/PytorchExp/install/include/"'
    # }
    # s.module_name='PytorchExp'
    # s.module_map = 'src/framework.modulemap'
    # s.library = ['c++', 'stdc++']
end
