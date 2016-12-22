module BigAuth
  require 'big_auth/service_config'
  
  # Twitter & Facebook app configs
  mattr_accessor :service_configs
  @@service_configs = {}

  mattr_accessor :default_role
  @@default_role = nil
  
  def self.setup
    yield self
  end
  
  # config.twitter APP_KEY, APP_SECRET, :scope => ['foo', 'bar']
  def self.twitter(app_key, app_secret, options = {})
    @@service_configs[:twitter] = BigAuth::ServiceConfig.new(app_key, app_secret, options)
  end
  
  def self.facebook(app_key, app_secret, options = {})
    @@service_configs[:facebook] = BigAuth::ServiceConfig.new(app_key, app_secret, options)
  end
 
  def self.hello_world
    puts "HELLO WORLD"
  end
 
  require 'big_auth/engine' #if defined?(Rails) && Rails::VERSION::MAJOR == 4
end

