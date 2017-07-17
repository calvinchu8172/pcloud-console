version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'push-sdk'
  s.version     = version
  s.summary     = 'Push SDK for Ruby'
  s.description = 'Push SDK for Ruby'
  s.licenses    = ['Nonstandard']
  s.authors     = ['ChouAndy']
  s.email       = ['chouandy@ecoworkinc.com']

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rails', '>= 4.2'
  s.add_dependency 'rest-client'
end
