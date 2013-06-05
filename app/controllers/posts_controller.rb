class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def create
    post = current_user.authored_posts.new(params[:post])
    post.user_id = params[:user_id]

    if post.save
      flash[:success] = "Post added!"
    else
      flash[:error] = "Invalid post."
    end

    redirect_to post.user
  end

  def show
    post = Post.find(params[:id])
    redirect_to post.user
  end
end
