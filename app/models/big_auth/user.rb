module BigAuth
class User < ActiveRecord::Base
  belongs_to :account
  has_many :roles, :through => :roles_users
  has_many :roles_users, :dependent => :destroy

  delegate :email, :login, :name, :picture_url, :to => :account

  def admin?
    has_role? :admin
  end

  def add_role(role)
    if r = Role.find_by_name(role.to_s)
      self.roles << r
    end
  end

  def has_role?(role)
    self.roles.find_by_name(role.to_s) ? true : false
  end

  def switch_role(args)
    self.roles.delete(Role.find_by_name(args[:from].to_s))
    self.add_role(args[:to])
  end

  # @names means Twitter. Otherwise, assume Facebook.
  def self.find_by_remote_login(login)
    if login.starts_with?('@') and login_account = BigAuth::LoginAccount.find_by_login(login[1..-1])
      login_account.account.user
    elsif login_account = BigAuth::LoginAccount.find_by_login(login)
      login_account.account.user
    end
  end

  protected
  def self.create_with_twitter_login(args)
   return nil if BigAuth::Account.find_by_email(args[:email]) or BigAuth::LoginAccount.find_by_login(args[:login])
   account = BigAuth::Account.create(:email => args[:email])
   login = BigAuth::LoginAccount.create(:type => "BigAuth::TwitterAccount", 
                                        :account => account, 
                                        :remote_account_id => args[:remote_account_id], 
                                        :name => args[:name], 
                                        :login => args[:login], 
                                        :picture_url => args[:picture_url])
   self.create(:account => account)
  end
end
end
