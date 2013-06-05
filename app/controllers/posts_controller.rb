class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def create
    post = current_user.authored_posts.new(params[:post])

    if post.save
      flash[:success] = "Post added!"
    else
      flash[:error] = "Invalid post."
    end

    redirect_to post.user
  end
end
