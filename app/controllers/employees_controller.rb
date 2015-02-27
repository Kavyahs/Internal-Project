class EmployeesController < ApplicationController
  before_filter :require_login

  def new
    @employee = Employee.new
    @projects = Project.where(user_id: current_user.id)
  end

  def index
    @employees=Employee.where(user_id: current_user.id).order("updated_at desc")
    @employee=@employees.first
    @projects = Project.where(user_id: current_user.id)
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.user_id = current_user.id
    if @employee.valid?
      @employee.save
      if params["Employeeprojects"].present?
        @employee.saveprojects(params["Employeeprojects"], @employee.id)
      end
      redirect_to employees_path
    else
      redirect_to new_employee_path
    end
  end

  def edit
    @projects = Project.where(user_id: current_user.id)
    @employee = Employee.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.valid?
      @employee.update(employee_params)
      if params["Employprojects"].present?
        @employee.saveprojects(params["Employprojects"], @employee.id)
      end
      redirect_to employees_path
    else
      render 'index'
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:employ_name, :phone_no, :department, :employ_information, :profile_picture)
  end
end