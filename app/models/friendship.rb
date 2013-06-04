class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :friend_id
  # also has a status: 0 for unapproved, 1 for approved

  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user_id, :friend_id, presence: true

  default_scope order('friendships.created_at DESC')

  def approve!
    self.status = 1
    [self, new_reverse_friendship].map { |f| f.save! }
  end

  def destroy!
    reverse_friendship = find_reverse_friendship
    reverse_friendship.destroy if reverse_friendship
    self.destroy
  end

  private

  def new_reverse_friendship
    reverse_friendship = self.class.new(user_id: self.friend_id,
                                        friend_id: self.user_id)
    reverse_friendship.status = self.status
    reverse_friendship
  end

  def find_reverse_friendship
    self.class.find_by_user_id_and_friend_id(self.friend_id, self.user_id)
  end
end
