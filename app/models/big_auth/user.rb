module BigAuth
class User < ActiveRecord::Base
  belongs_to :account
end
end
