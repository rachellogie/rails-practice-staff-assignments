class Location < ActiveRecord::Base

  validates :name, presence: true

  has_many :assignments
  has_many :people, through: :assignments


end