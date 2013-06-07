class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # Mailboxer gem
  acts_as_messageable
  
  # User profile basics
  attr_accessible :profile_attributes
  has_one :profile, inverse_of: :user
  accepts_nested_attributes_for :profile

  has_many :friendships
  has_many :friends, through: :friendships,
  conditions: ['friendships.status', 1]
  has_many :pending_friend_requests, class_name: "Friendship", foreign_key: "friend_id", conditions: { status: 0 }
  has_many :pending_sent_friend_requests, class_name: "Friendship", conditions: { status: 0 }

  has_many :wall_posts, class_name: "Post", inverse_of: :user
  has_many :authored_posts, class_name: "Post", inverse_of: :author, foreign_key: "author_id"
p
  has_many :authored_comments, class_name: "Comment", inverse_of: :author, foreign_key: "author_id"

  validates :email, uniqueness: true

  delegate :name, to: :profile

  def has_friend?(another_user)
    friend_ids.include?(another_user.id)
  end

  def is_friend_of?(another_user)
    another_user.has_friend?(self)
  end

  def find_friendship(another_user)
    friendships.find_by_friend_id(another_user.id)
  end

  def mutual_friends(another_user)
    self.friends.where(id: another_user.friend_ids)
  end

  def self.find_by_name(name)
    names = name.split.map(&:capitalize)
    case names.count
    when 1
      find_by_first_name(names.first) + find_by_last_name(names.first)
    when 2
      find_by_full_name(names)
    else
      raise "Invalid name"
    end
  end

  private

  def self.find_by_first_name(name)
    User.joins(:profile).where(profiles: {first_name: name})
  end

  def self.find_by_last_name(name)
    User.joins(:profile).where(profiles: {last_name: name})
  end

  def self.find_by_full_name(names)
    fname, lname = names
    User.joins(:profile).where(profiles: {first_name: fname, last_name: lname})
  end
end
