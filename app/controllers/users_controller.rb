class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in(@user)
      flash.now[:notice] = 'You have been signed up successfully!'
      redirect_to @user
    else
      render 'new'
    end
  end

  # def show
  #   @upcoming_events = current_user.upcoming_events
  #   @past_events = current_user.past_events
  # end
  def show
    @user = User.find(params[:id])
  end


end
