class LikesController < ApplicationController
  before_filter :load_likable

  def create
    like = @likable.likes.new(liker_id: current_user.id)

    # Flash doesn't work due to posts#show redirecting again
    if like.save
      flash[:success] = "Liked!"
    else
      flash[:error] = "Already liked."
    end

    redirect_to @likable.user
  end

  def destroy
    like = @likable.likes.find_by_liker_id(current_user.id)

    like.destroy
    flash[:success] = "Unliked!"
    redirect_to @likable.user
  end

  private

  def load_likable
    resource, id = request.path.split('/')[1, 2]
    @likable = resource.singularize.classify.constantize.find(id)
  end
end
