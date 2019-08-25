Pod::Spec.new do |s|
  s.name             = 'PytorchExpSwift'
  s.version          = '0.0.1'
  s.authors          = 'xta0'
  s.license          = { :type => 'MIT' }
  s.homepage         = 'https://github.com/xta0/Pytorch-iOS'
  s.source           = { :git => 'https://github.com/xta0/Pytorch-iOS.git', :branch => "master" }
  s.summary          = 'PytorchExp for Swift'
  s.description      = <<-DESC
  An open source machine learning framework that accelerates the path from research prototyping to production deployment.
                       DESC

  s.ios.deployment_target = '10.3'

  s.module_name = 'PytorchExp'
  s.static_framework = true

  swift_dir =  'swift/'
  s.source_files = swift_dir + 'src/*.swift'
  s.dependency 'Pytorch-Exp', :git => 'https://github.com/xta0/Pytorch-iOS.git'
end