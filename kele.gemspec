 Gem::Specification.new do |s|
   s.name          = 'keleclient5'
   s.version       = '0.0.1'
   s.date          = '2018-02-27'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Joseph M. OConnor']
   s.email         = 'tiluser0@gmail.com'
   s.files         = ['lib/kele.rb']
   s.require_paths = ["lib"]
   s.homepage      = 'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
 end