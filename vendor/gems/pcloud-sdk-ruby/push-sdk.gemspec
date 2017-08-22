version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'pcloud-sdk'
  s.version     = version
  s.summary     = 'PCloud SDK for Ruby'
  s.description = 'PCloud SDK for Ruby'
  s.licenses    = ['Nonstandard']
  s.authors     = ['Calvin Chu']
  s.email       = ['calvinchu@ecoworkinc.com']

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rails', '>= 4.2'
  s.add_dependency 'rest-client'
end
