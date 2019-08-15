Pod::Spec.new do |s|
    s.name             = 'PytorchC'
    s.version          = '0.0.1'
    s.authors          = 'xta0'
    s.license          = { :type => 'MIT' }
    s.homepage         = 'https://github.com/xta0/Pytorch-iOS'
    s.source           = { :http => "https://xta0.me/resource/PytorchC_08142019.tar.gz" }
    s.summary          = 'Pytorch iOS Beta'
    s.description      = <<-DESC
    An internal-only pod containing the Pytorch C++ code for iOS. This pod is not
    intended to be used directly.
                         DESC
  
    s.ios.deployment_target = '9.0'
    s.module_name = 'PytorchC'
    s.library = 'c++'
    s.vendored_frameworks = 'Framework/PytorchC.framework'
end