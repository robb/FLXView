Pod::Spec.new do |s|
  s.name         = "FLXView"
  s.version      = "0.0.1"
  s.summary      = "A convenient way to layout views using flexbox."

  s.description  = <<-DESC
                    A convenient way to layout views using flexbox. Check out the Example.playground.

                    It uses Facebook's [flexbox implementation](https://github.com/facebook/css-layout) and was inspired by Josh Abernathy's [SwiftBox](https://github.com/joshaber/SwiftBox).
                   DESC

  s.homepage     = "https://github.com/robb/FLXView"
  s.license      = { :type => 'BSD', :text => '
Copyright (c) 2015 Robert Böhnke.

All rights reserved.

Redistribution and use in source and binary forms are permitted
provided that the above copyright notice and this paragraph are
duplicated in all such forms and that any documentation,
advertising materials, and other materials related to such
distribution and use acknowledge that the software was developed
by the <organization>. The name of the
<organization> may not be used to endorse or promote products derived
from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.' }
  s.author       = { "Robert Böhnke" => "robb@robb.is" }
  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/robb/FLXView.git",
                     :tag => "#{s.version}",
                     :submodules => true }
  s.source_files  = "FLXView/**/*.{h,m}", "Carthage/**/Layout.{h,c}"
  s.public_header_files = "FLXView/**/*.h"

  s.framework  = "UIKit"
  s.requires_arc = true
end
