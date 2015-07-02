Pod::Spec.new do |s|
  s.name         = "FLXView"
  s.version      = "0.0.1"
  s.summary      = "A convenient way to layout views using flexbox."

  s.description  = <<-DESC
                    A convenient way to layout views using flexbox. Check out the Example.playground.

                    It uses Facebook's [flexbox implementation](https://github.com/facebook/css-layout) and was inspired by Josh Abernathy's [SwiftBox](https://github.com/joshaber/SwiftBox).
                   DESC

  s.homepage     = "https://github.com/robb/FLXView"
  s.license      = "MIT"
  s.author       = { "Robert Böhnke" => "robb@robb.is" }
  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/robb/FLXView.git",
                     :tag => "#{s.version}",
                     :submodules => true }
  s.source_files  = "FLXView/**/*.{h,m}", "Carthage/Checkouts/css-layout/src/*.{h,c}"
  s.public_header_files = "FLXView/**/*.h"

  s.framework  = "UIKit"
  s.requires_arc = true
end
