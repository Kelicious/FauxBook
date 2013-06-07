class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if @user.id == current_user.id
      current_user.unread_posts_count = 0
      current_user.save
    end
  end

  def create
    post = current_user.authored_posts.new(params[:post])
    id = params[:user_id].to_i
    unless current_user.id == id || current_user.friend_ids.include?(id)
      flash[:error] = "You may only post on your friends' walls'"
      redirect_to root_url
      return
    end

    post.user_id = params[:user_id]

    if post.save
      user = post.user
      user.unread_posts_count += 1
      user.save
      flash[:success] = "Post added!"
    else
      flash[:error] = "Invalid post."
    end

    redirect_to post.user
  end
end
