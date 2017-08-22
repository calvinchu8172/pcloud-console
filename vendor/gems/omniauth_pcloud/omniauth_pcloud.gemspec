version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'omniauth_pcloud'
  s.version     = version
  s.summary     = 'OmniAuth for Pcloud'
  s.description = 'It is OmniAuth for Pcloud.'
  s.licenses    = ['Nonstandard']
  s.authors     = ['ChouAndy']
  s.email       = ['chouandy@ecoworkinc.com']

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rails', '>= 4.2'
  s.add_dependency 'devise', '>= 3.5'
  s.add_dependency 'omniauth', '~> 1.2'
  s.add_dependency 'omniauth-oauth2', '1.3.1'
end
