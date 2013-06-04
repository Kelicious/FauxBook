class WorkPlace < ActiveRecord::Base
  attr_accessible :name, :position, :start_date, :end_date, :description
  attr_accessible :profile_id

  belongs_to :profile, inverse_of: :work_places

  default_scope order('work_places.start_date DESC')

  validates :name, :profile, presence: true
end
