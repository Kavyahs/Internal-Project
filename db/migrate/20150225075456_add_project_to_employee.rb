class AddProjectToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :project, index: true
  end
end
