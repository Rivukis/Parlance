Pod::Spec.new do |s|
  s.name             = 'Parlance'
  s.version          = '0.1.1'
  s.summary          = 'Convenient, scalable, type-safe localization for Swift iOS projects.'

  s.description      = <<-DESC
    Parlance provides a convenient and type-safe way to localize and pluralize a project. Use enums instead of the standard hard coded strings. Ability to break up localization into separate modules for cleanliness.
                       DESC

  s.homepage         = 'https://github.com/Rivukis/Parlance'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brian Radebaugh' => 'Rivukis@gmail.com' }
  s.source           = { :git => 'https://github.com/Rivukis/Parlance.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'Parlance/Source/*'

  # s.frameworks = Foundation', 'UIKit'
end
