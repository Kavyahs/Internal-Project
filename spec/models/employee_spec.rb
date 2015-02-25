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

  it "should validate employ_name as true" do
    employee.employ_name="employee name"
    expect(employee.valid?).to be_truthy
  end

  it "should validate employ_name as false" do
    employee.employ_name="e"*31
    expect(employee.valid?).to be_falsy
  end

  it "should validate phone_no as true" do
    employee.phone_no="0123654789"
    expect(employee.valid?).to be_truthy
  end

  it "should validate phone_no as false" do
    employee.phone_no="010101010101"
    expect(employee.valid?).to be_falsy
  end

  it "should validate department as true" do
    employee.department="Development"
    expect(employee.valid?).to be_truthy
  end

  it "should validate department as false" do
    employee.department=""
    expect(employee.valid?).to be_falsy
  end

  it "should validate employ_information as true" do
    employee.employ_information="information of employee"
    expect(employee.valid?).to be_truthy
  end

  it "should validate employ_information as false" do
    employee.employ_information="a"*321
    expect(employee.valid?).to be_falsy
  end
end