class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @name = params[:q]
    if @name
      @users = User.find_by_name(@name)
    else
      @users = User.all
    end
  end

  def show
    @user = (id = params[:id]) ? User.find(id) : current_user
  end

  def info
    @user = User.find(params[:user_id])
  end

  def friends
    @user = User.find(params[:user_id])
  end

  def mutual_friends
    @user = User.find(params[:user_id])
  end
end
