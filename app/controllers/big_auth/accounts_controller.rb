module BigAuth
class AccountsController < ApplicationController
  # GET /accounts/1/edit
  def edit
    @account = current_user.account
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = current_user.account

    respond_to do |format|
      if @account.update_attributes(params[:big_auth_account])
        format.html { redirect_to("/", :notice => 'Account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end
end
end
