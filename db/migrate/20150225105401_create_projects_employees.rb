class CreateProjectsEmployees < ActiveRecord::Migration
  def change
    create_table :projects_employees do |t|
      t.references :project, index: true
      t.references :employee, index: true

      t.timestamps
    end
  end
end
