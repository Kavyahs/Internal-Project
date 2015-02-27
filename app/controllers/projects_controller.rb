class ProjectsController < ApplicationController
  before_filter :require_login

  def new
    @project = Project.new
    @employees = Employee.all
  end

  def index
    @projects = Project.order("updated_at desc")
    @project = @projects.first
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.valid?
      @project.save
      if params["Projectemployee"].present?
        @project.saveemployees(params["Projectemployee"], @project.id)
      end
      redirect_to projects_path
    else
      redirect_to new_project_path
    end
  end

  def edit
    @employees = Employee.all
    @project = Project.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.valid?
      @project.update(project_params)
      if params["Projectemployee"].present?
        @project.saveemployees(params["Projectemployee"], @project.id)
      end
      redirect_to projects_path
    else
      render 'index'
    end
  end

  private
  def project_params
    params.require(:project).permit(:project_name, :projrct_description, :project_information, :project_icon)
  end
end
