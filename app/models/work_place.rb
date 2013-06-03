class WorkPlace < ActiveRecord::Base
  attr_accessible :name, :position, :start_date, :end_date, :description
  attr_accessible :profile_id

  belongs_to :profile, inverse_of: :work_places

  validates :name, presence: true
end
