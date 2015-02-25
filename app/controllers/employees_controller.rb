class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def index
    @employees=Employee.order("updated_at desc")
    @employee=@employees.first
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render 'index'
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:employ_name, :phone_no, :projects_name, :department, :employ_information, :profile_picture)
  end
end