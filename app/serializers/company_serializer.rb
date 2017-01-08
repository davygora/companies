class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :location
  has_many :employees
end
