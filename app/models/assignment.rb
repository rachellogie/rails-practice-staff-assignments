class Assignment < ActiveRecord::Base

  belongs_to :location

  validates :role, presence: true

  validates :location_id, uniqueness: {scope: [:role, :person_id], message: 'You already have this assignment!'}

end