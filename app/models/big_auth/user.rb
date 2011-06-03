module BigAuth
class User < ActiveRecord::Base
  belongs_to :account
  has_many :roles, :through => :roles_users, :dependent => :destroy
  has_many :roles_users, :dependent => :destroy

  delegate :email, :login, :name, :picture_url, :to => :account

  def admin?
    has_role? :admin
  end

  def has_role?(role)
    self.roles.find_by_name(role.to_s) ? true : false
  end

  def foo
    self.site
  end
end
end
