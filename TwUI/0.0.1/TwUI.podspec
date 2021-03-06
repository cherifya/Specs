Pod::Spec.new do |s|
  s.name           = "TwUI"
  s.version        = "0.0.1"
  s.summary        = "A UI framework for Mac based on Core Animation."
  s.description    = "TwUI is a hardware accelerated UI framework for Mac, inspired by UIKit. It enables:\n"\
                     "- GPU accelerated rendering backed by CoreAnimation.\n"\
                     "- Simple model/view/controller development familiar to iOS developers."
  s.homepage       = "https://github.com/twitter/twui"
  s.author         = { "Twitter, Inc." => "opensource@twitter.com" }
  s.license        = { :type => 'Apache License, Version 2.0' }
  s.source         = { :git => "https://github.com/twitter/twui.git", :commit => "0d03e1aa88bb2ed73e02b5eaac3e993254ca0545" }

  s.platform       = :osx, '10.6'
  s.compiler_flags = '-Wno-objc-missing-super-calls'
  s.frameworks     = 'ApplicationServices', 'QuartzCore', 'Cocoa'

  s.subspec 'Support' do |ss|
    ss.source_files = 'lib/Support'
  end

  s.subspec 'UIKit' do |ss|
    ss.source_files = FileList['lib/UIKit/*.{h,m}'].exclude(/TUIAccessibilityElement/)
    ss.dependency 'TwUI/Support'
  end
end
