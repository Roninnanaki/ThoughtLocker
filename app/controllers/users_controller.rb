class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.recent.paginate(page: params[:page])
  end

  def new
    @user = User.new
    @hide_header_and_footer = true
  end

  def create
    @user = User.new(user_params)
    @user.name = @user.email[/(.*?)(?=@)/, 1]

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the ThoughtLocker!"
      redirect_to @user
    else
      @hide_header_and_footer = true
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
