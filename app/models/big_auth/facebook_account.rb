module BigAuth
  class FacebookAccount < LoginAccount
    def assign_account_info(auth_hash)
      self.remote_account_id  = auth_hash['uid']
      self.login              = auth_hash.info.email
      self.name               = auth_hash.info.name
      self.remote_token       = auth_hash.credentials.token
    end
  
    def account_url
      "http://facebook.com/#{self.login}"
    end
  
    def picture_url
      if self.login.include?('profile.php')
        "https://graph.facebook.com/#{self.login.gsub(/[^\d]/, '')}/picture?type=square"
      else
        "https://graph.facebook.com/#{self.login}/picture?type=square"
      end
    end
  end
end
