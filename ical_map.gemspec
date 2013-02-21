Gem::Specification.new do |s|
  s.name        = 'ical_map'
  s.version     = '0.0.0'
  s.date        = '2013-02-21'
  s.summary     = "Hola!"
  s.description = "A simple hello world gem"
  s.authors     = ["Benjamin Durin"]
  s.email       = 'benjamin@codegreenit.com'
  s.files       = ["lib/ical_map.rb"]
  s.homepage    = 'http://rubygems.org/gems/ical_map'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end