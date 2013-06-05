class Like < ActiveRecord::Base
  attr_accessible :liker_id

  belongs_to :likable, polymorphic: true
  belongs_to :liker, class_name: "User"

  validates :liker_id, presence: true, uniqueness: {
    scope: [:likable_id, :likable_type]
  }
end
