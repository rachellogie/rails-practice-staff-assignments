class Assignment < ActiveRecord::Base

  belongs_to :location

  validates :role, presence: true

end