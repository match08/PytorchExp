Pod::Spec.new do |s|
    s.name             = 'Pytorch'
    s.version          = '0.0.5'
    s.authors          = 'xta0'
    s.license          = { :type => 'MIT' }
    s.homepage         = 'https://github.com/xta0/Pytorch-iOS'
    s.source           = { :git => 'git@github.com:xta0/Pytorch-iOS.git', :tag => s.version }
    s.summary          = 'Pytorch iOS Beta'
    s.description      = <<-DESC
    An internal-only pod containing the Pytorch C++ code for iOS. This pod is not
    intended to be used directly.
    DESC

    s.ios.deployment_target = '10.3'
    s.default_subspec = %[Core]
    s.subspec 'Core' do |ss|
        ss.dependency 'Pytorch/API'
        ss.source_files = 'src/*{.h,.m,.hh,.mm}'
        ss.public_header_files = 'src/Pytorch.h'
        ss.library = 'c++'
    end
    
    s.subspec 'API' do |ss|
        ss.header_mappings_dir = 'install/include/'
        ss.preserve_paths = 'install/include/**/*.h', 'install/include/ATen/*', 'install/include/torch/*'
        ss.xcconfig = {
          'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Pytorch/install/include/"',
            'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/Pytorch/install/lib/libtorch.a"'
        }
        ss.vendored_libraries = 'install/lib/libtorch.a'
        
    end
    s.library = 'c++'
    s.xcconfig = {
         'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
         'CLANG_CXX_LIBRARY' => 'libc++'
    }
end
