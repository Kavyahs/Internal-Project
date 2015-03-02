require 'rails_helper'

RSpec.describe EmployeesController, :type => :controller do

  let(:employee) {FactoryGirl.create(:employee)}
  let(:project) {FactoryGirl.create(:project)}
  let(:user) {FactoryGirl.create(:user)}

  describe "GET index" do
    it "assigns all employees as @employee" do
      get :index
      assigns(:project).should eq(@project)
      assigns(:employee).should eq(@employee)
    end
  end

  describe "POST create" do
    it "should create a employee" do
      employee_params = {
        employee: {
          employ_name: "name is employee",
          phone_no: "1234567890",
          department: "Development",
          employ_information: "my address my city",
          profile_picture: "smile.jpeg"
        }
      }
      session[:user_id] = user.id
      expect do
        post :create, employee_params
      end.to change(Employee, :count).by(1)
    end
  end

  describe "PATCH update" do
    it "should update a employee" do
      value = employee
      patch :update,  {:id => employee.id, :employee => {employ_name: "new name", phone_no: "1234569852", projects_name: "new project", department: "HR", employ_information: "information changed", profile_picture: "newpic.jpg"}}
      assigns(value).should_not eq(employee)
    end
  end
end