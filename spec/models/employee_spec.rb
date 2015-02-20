require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) {FactoryGirl.create(:employee)}
  context "Factory settings for users" do
    it "should validate the user factories" do
      expect(FactoryGirl.build(:employee).valid?).to be true
    end
  end

  describe Employee do
    it { should validate_presence_of :employ_name }
    it { should validate_presence_of :phone_no }
    it { should validate_presence_of :department }
    it { should allow_value('Kavya H S').for(:employ_name)}
    it { should allow_value('1234567890').for(:phone_no)}
    it { should allow_value('Development').for(:department)}
  end

  it "should validate employ_name" do
    ["employee name", "Name employee"].each do |n|
      employee.employ_name = n
      expect(employee.valid?).to be_truthy
    end
    ["aaaaaassssss   ddd  dffffffgggggghhh", "lllkkkjjjhhhgggfffdddsss yypppooo"].each do |n|
      employee.employ_name = n
      expect(employee.valid?).to be_falsy
    end
  end

  it "should validate phone_no" do
    ["1234567891", "0123654789"].each do |n|
      employee.phone_no = n
      expect(employee.valid?).to be_truthy
    end
    ["123456789123", "010101010101"].each do |n|
      employee.phone_no = n
      expect(employee.valid?).to be_falsy
    end
  end

  it "should validate department" do
    ["Development", "HR"].each do |n|
      employee.department = n
      expect(employee.valid?).to be_truthy
    end
    ["", ""].each do |n|
      employee.department = n
      expect(employee.valid?).to be_falsy
    end
  end

  it "should validate employ_information" do
    ["information of employee", "descripion 123456789"].each do |n|
      employee.employ_information = n
      expect(employee.valid?).to be_truthy
    end
    ["They are usually between four to eight sentences. Paragraphs can begin with an
      indentation (about five spaces), or by missing a line out, and then starting ag
        This thesis statement of the paragraph tells the reader what the paper will be ab
        about the body paragraph. After one has completed an essay, one must close with
        a conclusion which restates the main idea.",
        "ain; this makes telling when one paragraph ends and another begins easier. In most
        out. The intro is used to give basic knowledge about the thesis. The body paragra
        phs are used to tell why your thesis is relevant. The thesis contains the main idea
        about the body paragraph. After one has completed an essay, one must close with
        a conclusion which restates the main idea."].each do |n|
      employee.employ_information = n
      expect(employee.valid?).to be_falsy
    end
  end
end