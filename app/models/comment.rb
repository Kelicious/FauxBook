class Comment < ActiveRecord::Base
  attr_accessible :body, :author_id
  
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User", inverse_of: :authored_comments

  validates :body, :author_id, presence: true
end
