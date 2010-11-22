lib = File.expand_path('../lib/', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'big_auth/version'
require 'bundler'

Gem::Specification.new do |gem|  
  gem.name          = 'big_auth'
  gem.version       = BigAuth::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ['Tony Stubblebine']
  gem.email         = 'tony@tonystubblebine.com'
  gem.homepage      = 'http://github.com/tonystubblebine/big_auth'
  gem.summary       = 'Twitter and Facebook logins for your Rails application.'
  gem.description   = 'Twitter and Facebook logins for your Rails application.'
  gem.has_rdoc      = false
  gem.files         = %w(README.md) + Dir.glob('{lib,app,config}/**/*')
  gem.require_path  = 'lib'
  
  gem.add_dependency 'oa-core',     '~> 0.1.2'
  gem.add_dependency 'oa-oauth',    '~> 0.1.2'
  gem.add_dependency 'bcrypt-ruby', '~> 2.1'
end
