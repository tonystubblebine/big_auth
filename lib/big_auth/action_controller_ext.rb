ActionController::Base.class_eval do
  def self.require_user(options = {})
    raise Exception, "require_user cannot be called on ActionController::Base. Only it's subclasses" if self ==  ActionController::Base
    prepend_before_filter :require_user, options
  end
  
  helper_method :current_user, :current_user?
  
  def current_user
    @current_user ||= if session[:account_id] and defined?(current_site)
      account = BigAuth::Account.find(session[:account_id]) && current_site && account.users.find_by_site_id(current_site.id)
    elsif session[:account_id]
      account = BigAuth::Account.find(session[:account_id]) && account.users.first
    elsif cookies[:remember_token] and defined?(current_site)
      account = BigAuth::Account.find_by_remember_token(cookies[:remember_token]) && current_site && account.users.find_by_site_id(current_site.id)
    elsif cookies[:remember_token] and defined?(current_site)
      account = BigAuth::Account.find_by_remember_token(cookies[:remember_token]) && account.users.first
    else
      false
    end
  end
  
  def current_user?
    !!current_user
  end
 
  protected
  
  # Filters
  
  def require_user
    current_user.present? || deny_access
  end

  def require_no_user
    !current_user.present? || deny_access
  end

  def require_super_user
    (current_user.present? and current_user == User.first) || deny_access
  end
  
  # Utils
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  def deny_access
    store_location
    redirect_to login_path
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
 
  def current_user=(user)
    user.tap do |user|
      user.account.remember
      session[:account_id]         = user.account.id
      cookies[:remember_token]  = user.account.remember_token
    end
  end
  
  def logout!
    session[:account_id] = nil
    @current_user     = nil
    cookies.delete(:remember_token)
    session[:return_to] = nil
  end
  
end
