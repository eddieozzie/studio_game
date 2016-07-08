Gem::Specification.new do |s|
  s.name         = "Studio Game"
  s.version      = "1.0"
  s.author       = "Edward Butler"
  s.email        = "eddieozzie@gmail.com"
  s.homepage     = "http://www.coppellappdevelopment@gmail.com"
  s.summary      = "This is a game I developed as part of the Pragmatic Studio class."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end