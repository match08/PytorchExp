Pod::Spec.new do |s|
    s.name             = 'Pytorch-Exp'
    s.version          = '0.0.1'
    s.authors          = 'xta0'
    s.license          = { :type => 'MIT' }
    s.homepage         = 'https://github.com/xta0/Pytorch-iOS'
    s.source           = { :git => 'https://github.com/xta0/Pytorch-iOS.git', :branch => "master" }
    s.summary          = 'Pytorch iOS Beta'
    s.description      = <<-DESC
    An internal-only pod containing the Pytorch C++ code for iOS. This pod is not
    intended to be used directly.
    DESC

    s.ios.deployment_target = '10.3'
    s.source_files = 'src/*{.h,.m,.mm,.cpp}', 'install/include/**/*.{h,cpp,cc,c}'
    s.public_header_files = 'src/Pytorch.h'
    s.header_mappings_dir = 'install/include/'
    s.xcconfig = {
               'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Pytorch-Exp/install/include/"',
                 'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/Pytorch-Exp/install/lib/libtorch.a"'
    }
    s.vendored_libraries = 'install/lib/libtorch.a'
    s.libraries = 'c++', 'stdc++'

    # s.default_subspec = 'Core'
    # s.subspec 'Core' do |ss|
    #     ss.dependency 'Pytorch/API'
    #     ss.source_files = 'src/*{.h,.m,.hh,.mm}'
    #     ss.public_header_files = 'src/Pytorch.h'
    # end
    
    # s.subspec 'API' do |ss|
    #     ss.header_mappings_dir = 'install/include/'
    #     ss.preserve_paths = 'install/include/**/*.{h,cpp,cc,c}'
    #     ss.xcconfig = {
    #       'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Pytorch/install/include/"',
    #         'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/Pytorch/install/lib/libtorch.a"'
    #     }
    #     ss.xcconfig = {
    #         'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
    #         'CLANG_CXX_LIBRARY' => 'libc++'
    #    }
    #     ss.vendored_libraries = 'install/lib/libtorch.a'
    #     ss.libraries = 'c++', 'stdc++'
    # end
    # s.library = 'c++', 'stdc++'
end
