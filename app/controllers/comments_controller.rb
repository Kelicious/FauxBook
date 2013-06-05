class CommentsController < ApplicationController
  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def create
    comment = @commentable.comments.new(params[:comment])
    comment.author_id = current_user.id

    if comment.save
      flash[:success] = "Comment added!"
    else
      flash[:error] = "Invalid comment."
    end

    redirect_to @commentable
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
