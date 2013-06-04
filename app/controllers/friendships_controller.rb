class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @friend_requests = current_user.pending_friend_requests
  end

  def create
    current_user.friendships.create!(friend_id: params[:user_id])
    flash[:notice] = "Friend request sent!"
    redirect_to User.find(params[:user_id])
  end

  def update
    friendship = Friendship.find(params[:id])
    friendship.approve!
    flash[:success] = "Friend added!"
    redirect_to friendship.friend
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy!
    flash[:error] = "Friend removed!"
    redirect_to friendship.friend
  end
end
