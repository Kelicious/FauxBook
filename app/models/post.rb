class Post < ActiveRecord::Base
  include Likable
  attr_accessible :body, :user_id, :author_id

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy
  has_many :likers, through: :likes

  belongs_to :user, inverse_of: :wall_posts
  belongs_to :author, class_name: "User", inverse_of: :authored_posts

  validates :body, :user_id, :author_id, presence: true

  default_scope order('posts.created_at DESC')
end
