require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) {FactoryGirl.create(:project)}
  context "Factory settings for projects" do
    it "should validate the project factories" do
      expect(FactoryGirl.build(:project).valid?).to be true
    end
  end

  describe Project do
    it { should validate_presence_of :project_name }
    it { should validate_presence_of :projrct_description }
    it { should allow_value('my project').for(:project_name)}
    it { should allow_value('project description').for(:projrct_description)}
  end

  it "should validate project_name as true" do
    project.project_name="project name"
    expect(project.valid?).to be_truthy
  end

  it "should validate project_name as false" do
    project.project_name="e"*31
    expect(project.valid?).to be_falsy
  end

  it "should validate projrct_description as false" do
    project.projrct_description="description is here"
    expect(project.valid?).to be_truthy
  end

  it "should validate project_information as true" do
    project.project_information="information of project"
    expect(project.valid?).to be_truthy
  end

  it "should validate project_information as false" do
    project.project_information="a"*321
    expect(project.valid?).to be_falsy
  end
end
