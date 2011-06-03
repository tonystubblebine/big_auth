Rails::Application.routes.draw do
  namespace "big_auth" do
    resources :roles
    resources :roles_users
    resources :accounts, :only => [:edit, :update]
  end

  match '/login'                  => 'big_auth/auth#new',      :as => :login
  match '/auth/:service/callback' => 'big_auth/auth#callback'
  match '/auth/failure'           => 'big_auth/auth#failure'
  match '/logout'                 => 'big_auth/auth#destroy',  :as => :logout
end
