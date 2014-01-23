Pod::Spec.new do |s|
  s.name         = "NSView-NewConstraints"
  s.version      = "0.0.1"
  s.summary      = "Constraint helpers."
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }

  s.frameworks   = 'Foundation'
  s.platform     = :osx, '10.7'
  s.source       = { :git => "https://github.com/dpostigo/NSView-NewConstraints.git", :tag => s.version.to_s }
  s.source_files = 'NSView-NewConstraints/*.{h,m}'

  s.requires_arc = true

end
