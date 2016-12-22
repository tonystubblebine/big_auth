module BigAuth
  class Account < ActiveRecord::Base
    unloadable
    has_many :login_accounts, :class_name => 'BigAuth::LoginAccount', :dependent => :destroy
    has_many :users, :class_name => "::User", :dependent => :destroy
    #delegate :login, :name, :picture_url, :to => :login_account

    def find_or_create_user(site=nil)
      if site.nil? and !self.users.empty?
        return self.users.first
      elsif (site and user = self.users.find_by_site_id(site.id))
        return user
      end

      user = ::User.create do |u|
        u.account = self
        u.site = site if site
      end

      if BigAuth.default_role
        role = Role.find_or_create_by(name: BigAuth.default_role)
        user.roles_users.create(:role => role)
      end
      user
    end

    def forget
      update_attributes(:remember_token => nil) unless new_record?
    end
    
    def from_facebook?
      login_accounts.last.kind_of? FacebookAccount
    end
 
    def from_twitter?
      login_accounts.last.kind_of? TwitterAccount
    end
 
    def login
      login_accounts.last.login
    end

    def user
      users.first
    end

    def name
      login_accounts.last.name
    end

    def picture_url
      if login_accounts.last.picture_url
        login_accounts.last.picture_url 
      elsif from_facebook?
        "http://graph.facebook.com/#{login_accounts.last.remote_account_id}/picture?type=square"
      end
    end
 
    def remember
      update_attributes(:remember_token => ::BCrypt::Password.create("#{Time.now}-#{self.login_accounts.map{|a| a.type.to_s}.join("-")}-#{self.login_accounts.map{|a|a.login.to_s}.join("-")}")) unless new_record?
    end
  end
end
