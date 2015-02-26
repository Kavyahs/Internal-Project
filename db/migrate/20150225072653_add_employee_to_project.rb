class AddEmployeeToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :employee, index: true
  end
end
