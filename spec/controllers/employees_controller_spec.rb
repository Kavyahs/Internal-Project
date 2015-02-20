require 'rails_helper'

RSpec.describe EmployeesController, :type => :controller do

  let(:employee) {FactoryGirl.create(:employee)}

  describe "GET create" do
    it "should create a employee" do
      employee_params = {
        employee: {
          employ_name: "name is employee",
          phone_no: "1234567890",
          projects_name: "My project",
          department: "Development",
          employ_information: "my address my city",
          profile_picture: "smile.jpeg"
        }
      }
      expect do
        post :create, employee_params
      end.to change(Employee, :count).by(1)
    end
  end
end