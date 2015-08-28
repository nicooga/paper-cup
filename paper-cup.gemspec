Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'paper-cup'
  s.version     = '0.2.0'
  s.date        = '2015-08-05'
  s.summary     = "Use of Open3 to make request"
  s.description = "Use curl with Open3 for making request"
  s.authors     = ["Mariano Matayoshi", "Ricardo Kleine Samson", "Nicolas Oga"]
  s.email       = 'matayoshi.mariano@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/casapick/paper-cup'
  s.license     = 'MIT'
  s.require_paths = ["lib"]

  s.add_development_dependency "minitest", '~> 5.8.0'
  s.add_development_dependency "minitest-happy", '~> 1.0.0'
  s.add_development_dependency "pry", '~> 0.10.1'
  s.add_development_dependency "rake", '~> 10.4.2'
end
