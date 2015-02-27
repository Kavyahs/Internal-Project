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

  describe "GET index" do
    it "assigns all projects as @project" do
      get :index
      assigns(:projects).should eq([project])
    end
  end

  describe "PATCH update" do
    it "should update a project" do
      value = project
      patch :update,  {:id => project.id, :project => {project_name: "new project", projrct_description: "internal project", project_information: "update of project info", project_icon: "icon.jpg"}}
      assigns(value).should_not eq(project)
    end
  end

end