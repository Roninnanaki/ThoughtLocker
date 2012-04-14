class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
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
end
