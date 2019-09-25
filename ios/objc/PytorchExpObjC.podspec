Pod::Spec.new do |s|
    s.name             = 'PytorchExpObjC'
    s.version          = '0.0.4'
    s.authors          = 'xta0'
    s.license          = { :type => 'MIT' }
    s.homepage         = 'https://github.com/xta0/PytorchExpObjC.git'
    s.source           = { :git => 'https://github.com/xta0/PytorchExp.git', :branch => "master" }
    s.summary          = 'PytorchExp for Objective-C'
    s.description      = <<-DESC
   Objective-C wrapper of PytorchExp
                         DESC
  
    s.ios.deployment_target = '12.0'
    s.module_name = 'PytorchExpObjC'
    s.static_framework = true

    objc_dir = 'ios/objc/'
    s.public_header_files = objc_dir + 'apis/*.h'
    s.source_files = [ objc_dir+'apis/*.{h,m,mm}', objc_dir+'src/*.{h,m,mm}' ]
    s.module_map = objc_dir+'apis/framework.modulemap'
    s.dependency 'LibTorch'
    header = ""
    s.pod_target_xcconfig = { 
      'HEADER_SEARCH_PATHS' => 
      '"${PODS_ROOT}/LibTorch/install/include" ' + 
      '"${PODS_ROOT}/PytorchExpObjC/' + objc_dir + 'apis"',
      'VALID_ARCHS' => 'x86_64 arm64' 
    }
    s.library = 'c++', 'stdc++'
    s.user_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/PytorchExp/install/include"'
    }
    # s.test_spec 'Tests' do |ts| 
    #   ts.source_files = objc_dir + 'Tests/*.{h,mm,m}'
    #   ts.resources = [ objc_dir + 'Tests/models/*.pt']
    #   ts.pod_target_xcconfig = {
    #     'OTHER_LDFLAGS' => '-force_load "$(PODS_ROOT)/PytorchExp/install/lib/libtorch.a"'
    #   }
    # end
  end