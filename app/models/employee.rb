class Employee < ActiveRecord::Base

  belongs_to :company

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :birthday, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
