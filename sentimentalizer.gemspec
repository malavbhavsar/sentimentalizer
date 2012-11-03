# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "sentimentalizer"
  s.version     = '0.0.0'
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Sentiment Analysis"
  s.email       = "malav.bhavsar@gmail.com"
  s.homepage    = "http://www.malavbhavsar.com"
  s.description = "Sentiment Analysis"
  s.authors     = ['Malav Bhavsar']

  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.test_files = ["test/api_spec.rb"]
  s.require_paths = ["lib"]

end
