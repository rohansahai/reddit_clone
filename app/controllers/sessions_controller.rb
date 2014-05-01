class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(session_params)
    if @user
      sign_in
      redirect_to root_url
    else
      flash[:errors] = ["Nice try, NSA"]
      redirect_to new_session_url
    end
  end

  def new
    @user = User.new
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end


end
