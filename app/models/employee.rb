class Employee < ActiveRecord::Base
  has_many :projects_employees
  has_many :projects, through: :projects_employees
  has_many :users

  mount_uploader :profile_picture, ImageUploader

  validates :employ_name, presence: true,
  :format => { with: /\A[a-zA-Z\s]+$\z/ }, :length => {:maximum => 30}

  validates :phone_no, presence: true, :format => { with: /\A\d{10}/ }, :length => {:maximum => 10}

  validates :department, presence: true

  validates :employ_information, :length => {:maximum => 320}

  def saveprojects(project, employee)
    project.each do |pr|
      @projectemployee = ProjectsEmployees.new(project_id: pr, employee_id: employee)
      @projectemployee.save
    end
  end

end
