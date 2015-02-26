class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :projrct_description
      t.text :employees_name
      t.text :project_information
      t.string :project_icon

      t.timestamps
    end
  end
end
