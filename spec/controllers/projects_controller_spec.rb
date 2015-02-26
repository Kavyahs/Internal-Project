require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) {FactoryGirl.create(:project)}

  describe "POST create" do
    it "should create a project" do
      project_params = {
        project: {
          project_name: "name is employee",
          projrct_description: "My project",
          project_information: "project info",
          project_icon: "project.jpeg"
        }
      }
      expect do
        post :create, project_params
      end.to change(Project, :count).by(1)
    end
  end

end
