source 'http://rubygems.org'

gem 'rails', '>4.0.0'
gem 'json', '1.8.3'
#gem 'omniauth-twitter', "~> 1.0.0"
gem 'omniauth-twitter', :github => 'arunagw/omniauth-twitter'
gem 'omniauth-facebook'

gem 'oa-core',      :require => 'omniauth/core'
gem 'oa-oauth',     :require => 'omniauth/oauth'

gem 'bcrypt'
gem 'will_paginate'
gem 'jeweler'

# Work around for using different paths to a gem based on environment. This work around requires that you set an environment variable in your .bash_profile
# export RUBYOPT=rubygems
# Source: http://www.cowboycoded.com/2010/08/10/using-2-sources-for-a-gem-in-different-environments-with-bundler/
# This should be fixed in Bundler 1.1, allowing us to move to "group :production do"
if ENV['MY_BUNDLE_ENV'] == "dev"
  gem "big_library", :require => "big_library", :path => "../big_library"
else
  gem "big_library", ">= 0.0.2", :require => "big_library", :git => "git://github.com/tonystubblebine/big_library.git"
end


