module BigAuth
class User < ActiveRecord::Base
  belongs_to :account
  has_many :roles, :through => :roles_users, :dependent => :destroy
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
end
end
