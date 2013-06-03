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
  
  attr_accessible :first_name, :last_name, :gender, :birth_date

  validates :first_name, :last_name, :birth_date, presence: true
  validates :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end
end
