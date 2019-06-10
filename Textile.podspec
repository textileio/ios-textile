Pod::Spec.new do |s|
  s.name                  = 'Textile'
  s.version               = '0.0.1-dev'
  s.summary               = 'Encrypted, recoverable, schema-based, cross-application data storage built on IPFS and LibP2P'
  s.description           = <<-DESC
                            The Textile pod provides iOS native access and helpers for the Textile platform.
                            Learn more about Textile at https://github.com/textileio/go-textile.
                          DESC
  s.homepage              = 'https://github.com/textileio/ios-textile'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'Textile' => 'contact@textile.io' }
  s.source                = { :git => 'https://github.com/textileio/ios-textile.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files          = 'Textile/Classes/**/*'
  s.requires_arc          = true
  # https://stackoverflow.com/questions/50024087/gomobile-bind-producing-library-with-pie-disabled-i386-arch
  s.pod_target_xcconfig   = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1', 'OTHER_LDFLAGS[arch=i386]' => '-Wl,-read_only_relocs,suppress' }
  s.dependency 'Protobuf', '~> 3.7'
  s.dependency 'TextileCore', '~> 0.2.6'
end
