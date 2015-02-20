class EmployeesController < ApplicationController

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid? && @employee.errors.blank?
      @employee.save
      redirect_to employees_path
    else
      render 'new'
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:employ_name, :phone_no, :projects_name, :department, :employ_information, :profile_picture)
  end
end
