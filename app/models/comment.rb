class Comment < ActiveRecord::Base
  include Likable
  attr_accessible :body, :author_id
  
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User", inverse_of: :authored_comments
  delegate :user, to: :commentable

  has_many :likes, as: :likable, dependent: :destroy
  has_many :likers, through: :likes

  validates :body, :author_id, presence: true
end
