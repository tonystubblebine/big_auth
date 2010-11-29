module BigAuth::TestHelper
  # Sets the current user in the session from the user fixtures.
  def login_as(user)
    if user.kind_of?(User)
      @request.session[:user_id] = user ? user.id : nil
    else
      @request.session[:user_id] = user ? users(user).id : nil
    end
  end
end
