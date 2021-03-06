class Project < ActiveRecord::Base
  has_many :employees, through: :projects_employees
  has_many :projects_employees
  has_many :users

  mount_uploader :project_icon, ImageUploader

  validates :project_name, presence: true, :length => {:maximum => 30}

  validates :projrct_description, presence: true

  validates :project_information, :length => {:maximum => 320}

  def saveemployees(employee, project)
    employee.each do |em|
      @projectemployee = ProjectsEmployees.new(employee_id: em, project_id: project)
      @projectemployee.save
    end
  end
end
