class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def create
    post = current_user.authored_posts.new(params[:post])

    unless current_user.friend_ids.include?(params[:user_id])
      flash[:error] = "You may only post on your friends' walls'"
      redirect_to root_url
      return
    end

    post.user_id = params[:user_id]

    if post.save
      flash[:success] = "Post added!"
    else
      flash[:error] = "Invalid post."
    end

    redirect_to post.user
  end
end
