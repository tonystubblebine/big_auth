module BigAuth
class RolesUser < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  validates_presence_of :role, :user
end
end
