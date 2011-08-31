class BigAuth::UsersController < ApplicationController
  unloadable
  before_filter :require_super_user
  layout "admin"
  
  # GET /big_auth/users
  # GET /big_auth/users.xml
  def index
    @users = BigAuth::User.paginate(:page => params[:page], :per_page => 100)
    @roles = BigAuth::Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @big_auth_users }
    end
  end

  # GET /big_auth/users/1
  # GET /big_auth/users/1.xml
  def show
    @big_auth_user = BigAuth::User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @big_auth_user }
    end
  end

  # GET /big_auth/users/new
  # GET /big_auth/users/new.xml
  def new
    @big_auth_user = BigAuth::User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @big_auth_user }
    end
  end

  # GET /big_auth/users/1/edit
  def edit
    @big_auth_user = BigAuth::User.find(params[:id])
  end

  # POST /big_auth/users
  # POST /big_auth/users.xml
  def create
    @big_auth_user = BigAuth::User.new(params[:big_auth_user])

    respond_to do |format|
      if @big_auth_user.save
        format.html { redirect_to(@big_auth_user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @big_auth_user, :status => :created, :location => @big_auth_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @big_auth_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /big_auth/users/1
  # PUT /big_auth/users/1.xml
  def update
    @big_auth_user = BigAuth::User.find(params[:id])
debugger
    respond_to do |format|
      if @big_auth_user.update_attributes(params[:big_auth_user])
        format.html { redirect_to(@big_auth_user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @big_auth_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /big_auth/users/1
  # DELETE /big_auth/users/1.xml
  def destroy
    @big_auth_user = BigAuth::User.find(params[:id])
    @big_auth_user.destroy

    respond_to do |format|
      format.html { redirect_to(big_auth_users_url) }
      format.xml  { head :ok }
    end
  end
end
