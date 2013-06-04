class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = (id = params[:id]) ? User.find(id) : current_user
  end

  def info
    @user = User.find(params[:user_id])
  end

  def friends
    @user = User.find(params[:user_id])
  end
end
