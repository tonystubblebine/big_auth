module BigAuth
  class Account < ActiveRecord::Base
    has_many :login_accounts, :class_name => 'BigAuth::LoginAccount', :dependent => :destroy
    has_many :users, :dependent => :destroy
    #delegate :login, :name, :picture_url, :account_url, :to => :login_account
     
    def to_param
      if !self.login.include?('profile.php?')
        "#{self.id}-#{self.login.gsub('.', '-')}"
      else
        self.id.to_s
      end
    end
  
    def from_twitter?
      login_account.kind_of? TwitterAccount
    end
  
    def from_facebook?
      login_account.kind_of? FacebookAccount
    end

    def remember
      update_attributes(:remember_token => ::BCrypt::Password.create("#{Time.now}-#{self.login_accounts.map{|a| a.type.to_s}.join("-")}-#{self.login_accounts.map{|a|a.login.to_s}.join("-")}")) unless new_record?
    end
  
    def forget
      update_attributes(:remember_token => nil) unless new_record?
    end

    def find_or_create_user(site=nil)
      return self.users.first if site.nil? and !self.users.empty?
      return user if site and user = self.users.find_by_site_id(site.id)

      ::User.create do |u|
        u.account = self
        u.site = site if site
      end
    end

  end
end
