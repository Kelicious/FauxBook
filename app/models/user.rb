class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # Stuff added by developer
  
  attr_accessible :profile_attributes
  has_one :profile, inverse_of: :user
  accepts_nested_attributes_for :profile

  validates :email, uniqueness: true

  def name
    profile.name
  end
end
