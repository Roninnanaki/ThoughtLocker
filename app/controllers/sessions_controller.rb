class SessionsController < ApplicationController
  def new
    @hide_header_and_footer = true
  end

  def create
    user = User.find_by(email: params.dig(:session, :email))
    if user&.authenticate(params.dig(:session, :password))
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = "Invalid email/password combination"
      @hide_header_and_footer = true
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
