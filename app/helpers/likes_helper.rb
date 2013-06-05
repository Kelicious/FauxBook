module LikesHelper
  def likable_like_path(likable)
    klass = likable.class.to_s.downcase.pluralize
    "/#{klass}/#{likable.id}/like"
  end
end
