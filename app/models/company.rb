class Company < ActiveRecord::Base

  has_many :employees

  validates :name, presence: true
  validates :location, presence: true
  validates_associated :employees
end
