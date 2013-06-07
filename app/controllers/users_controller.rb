class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @name = params[:q]
    if @name && @name.length > 0
      begin
        @users = User.find_by_name(@name)
      rescue => e
        flash[:error] = e.message
        redirect_to root_url
      end
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
