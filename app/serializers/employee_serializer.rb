class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :birthday, :email, :phone, :company_id
  belongs_to :company
end
