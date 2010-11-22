module BigAuth
  module AuthHelper
    def auth_request_path(options = {})
      "/auth/#{options[:service]}"
    end
    
    def twitter_login_button
      content_tag(:a, content_tag(:span, 'Sign in with Twitter'), :class => 'bigauth-button twitter', :href => auth_request_path(:service => 'twitter'))
    end
  
    def facebook_login_button
      content_tag(:a, content_tag(:span, 'Sign in with Facebook'), :class => 'bigauth-button facebook', :href => auth_request_path(:service => 'facebook'))
    end
  end
end
