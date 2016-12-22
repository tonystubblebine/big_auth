Rails.application.routes.draw do
  namespace "big_auth" do
    resources :users
    resources :roles
    resources :roles_users
    resources :accounts, :only => [:edit, :update]
  end

  get '/login'                  => 'big_auth/auth#new',      :as => :login
  get '/auth/:service/callback' => 'big_auth/auth#callback'
  get '/auth/failure'           => 'big_auth/auth#failure'
  get '/logout'                 => 'big_auth/auth#destroy',  :as => :logout
end
