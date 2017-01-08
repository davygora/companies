class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.date :birthday
      t.string :email
      t.string :phone
      t.belongs_to :company, index: true

      t.timestamps null: false
    end
  end
end
