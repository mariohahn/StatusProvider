Pod::Spec.new do |s|
  s.name         = 'StatusProvider'
  s.version      = '1.2.10'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/mariohahn/StatusProvider'
  s.author = {
    'Mario Hahn' => 'mario_hahn@me.com'
  }
  s.summary      = 'Protocol to handle initial Loadings, Emty Views and Error Handling in a ViewController & views'
  s.ios.deployment_target =     '9.0'
  s.tvos.deployment_target =    '9.0'
  s.source           = { :git => 'https://github.com/mariohahn/StatusProvider.git', :tag =>  "#{s.version}" }
  s.source_files = 'StatusProvider/StatusProvider/*.{swift}'
  s.requires_arc = true
end
