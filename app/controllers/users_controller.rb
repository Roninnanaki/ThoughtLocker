class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@blogs = @user.blogs.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  	@hide_header_and_footer = true
  end
  
  def create
    @user = User.new(params[:user])
    #REGEX_FOR_GETTING_NAME = /.*?(?=[@])/
    @user.name = @user.email[/(.*?)(?=[@])/, 1]
    
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the ThoughtLocker!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
end
