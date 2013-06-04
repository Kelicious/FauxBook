class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # User profile basics
  attr_accessible :profile_attributes
  has_one :profile, inverse_of: :user
  accepts_nested_attributes_for :profile

  has_many :friendships
  has_many :friends, through: :friendships,
  conditions: ['friendships.status', 1]
  has_many :pending_friend_requests, class_name: "Friendship", foreign_key: "friend_id", conditions: { status: 0 }
  has_many :pending_sent_friend_requests, class_name: "Friendship", conditions: { status: 0 }

  validates :email, uniqueness: true

  def name
    profile.name
  end

  def has_friend?(another_user)
    friend_ids.include?(another_user.id)
  end

  def is_friend_of?(another_user)
    another_user.has_friend?(self)
  end

  def find_friendship(another_user)
    friendships.find_by_friend_id(another_user.id)
  end
end
