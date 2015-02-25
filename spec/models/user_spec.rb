require 'rails_helper'
RSpec.describe User, :type => :model do
  let(:user) {FactoryGirl.create(:user)}
  context "Factory settings for users" do

    it "should validate the user factories" do
      expect(FactoryGirl.build(:user).valid?).to be true
    end
  end

  describe User do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email}
    it { should validate_uniqueness_of :email}
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should allow_value('Kavya H S').for(:name)}
    it { should allow_value('kavya@gmail.com').for(:email)}
  end

  it "should validate name as true" do
    user.name="Name Intial"
    expect(user.valid?).to be_truthy
  end

  it "should validate name as false" do
    user.name="name789"
    expect(user.valid?).to be_falsy
  end

  it "should validate email as true" do
    user.email="email.123@domain.com"
    expect(user.valid?).to be_truthy
  end

  it "should validate email as false" do
    user.email="email@com."
    expect(user.valid?).to be_falsy
  end

  it "should validate password as true" do
    user.password="kavya123"
    expect(user.valid?).to be_truthy
  end

  it "should validate password as false" do
    user.password="wg"
    expect(user.valid?).to be_falsy
  end
end