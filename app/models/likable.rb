module Likable
  def liked_by?(user)
    liker_ids.include?(user.id)
  end
end
