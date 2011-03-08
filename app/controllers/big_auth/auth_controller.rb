module BigAuth
  class AuthController < ApplicationController
  
    unloadable
  
    def new
      if current_user?
        flash[:notice] = 'You are already signed in. Please sign out if you want to sign in as a different user.'
        redirect_to(root_path)
      end
    end
  
    def callback    
      login_account = case request.env['rack.auth']['provider']
        when 'twitter' then
          BigAuth::TwitterAccount.find_or_create_from_auth_hash(request.env['rack.auth'])
        when 'facebook' then
          BigAuth::FacebookAccount.find_or_create_from_auth_hash(request.env['rack.auth'])
      end
    
      account = login_account.find_or_create_account
      self.current_user = account.find_or_create_user(defined?(current_site) ? current_site : nil)
      
      flash[:message] = 'You have logged in successfully.'
      redirect_back_or_default(root_path)
    end
  
    def failure
      flash[:error] = "We had trouble signing you in. Did you make sure to grant access? Please select a service below and try again."
      render :action => 'new'
    end
  
    def destroy
      logout!
      redirect_to(root_path)
    end
  end
end
