module BigAuth::TestHelper
  # Sets the current user in the session from the user fixtures.
  def login_as(account)
    if user.kind_of?(BigAuth::Account)
      @request.session[:account_id] = account ? account.id : nil
    else
      @request.session[:account_id] = account ? accounts(account).id : nil
    end
  end
end
