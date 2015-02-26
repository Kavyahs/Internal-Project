class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @employees = Employee.all
  end

  def create
    @project = Project.new(project_params)
    if @project.valid?
      @project.save
      if params["Projectemployee"].present?
        @project.saveemployees(params["Projectemployee"]["e"], @project.id)
      end
      redirect_to projects_path
    else
      redirect_to new_project_path
    end
  end

  private
  def project_params
    params.require(:project).permit(:project_name, :projrct_description, :project_information, :project_icon)
  end
end
