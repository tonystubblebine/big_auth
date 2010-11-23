require 'big_auth'

require 'rails'
require 'action_controller'
require 'big_auth/action_controller_ext'

require 'omniauth/core'
require 'omniauth/oauth'
require 'bcrypt'

module BigAuth
  class Engine < Rails::Engine
    
    config.to_prepare do
      ApplicationController.helper(BigAuth::AuthHelper)
    end
    
    initializer 'big_auth.load_middleware', :after=> :load_config_initializers do
      if BigAuth.service_configs[:twitter]
        config.app_middleware.use ::OmniAuth::Strategies::Twitter,
          BigAuth.service_configs[:twitter].app_key,
          BigAuth.service_configs[:twitter].app_secret
      end

      if BigAuth.service_configs[:facebook]
        config.app_middleware.use ::OmniAuth::Strategies::Facebook, 
          BigAuth.service_configs[:facebook].app_key,
          BigAuth.service_configs[:facebook].app_secret,
          BigAuth.service_configs[:facebook].options
      end
    end
    
  end
end
