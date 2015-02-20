class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employ_name
      t.string :phone_no
      t.string :projects_name
      t.string :department
      t.text :employ_information
      t.string :profile_picture

      t.timestamps
    end
  end
end
