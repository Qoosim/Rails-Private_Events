class SessionsController < ApplicationController
  include SessionsHelper

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = 'You have been logged in!'
      redirect_to user_path(user)
    else
      flash.now[:notice] = 'Invalid email/password combination!'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = 'You have been logged out!'
    redirect_to login_path
  end
end
