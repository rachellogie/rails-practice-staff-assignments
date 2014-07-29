class Person < ActiveRecord::Base

  validates :last_name, presence: true

  validates :first_name, presence: {message: "can't be blank if title is blank and vice versa.", :unless => :title?,}

  has_many :assignments
  has_many :locations, through: :assignments
end