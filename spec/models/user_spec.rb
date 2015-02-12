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

  it "should validate name" do

    # checking valid name
    ["Name Intial", "user name"].each do |n|
      user.name = n
      value = user.valid?
      expect(value).to be_truthy
    end
    # checking invalid name
    ["name789", "user@56"].each do |n|
      user.name = n
      value = user.valid?
      expect(value).to be_falsy
    end
  end

  it "should validate email" do

    # checking valid email
    ["email.123@domain.com", "email_123@domain.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_truthy
    end
    # checking invalid email
    ["email@com.", "email@.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_falsy
    end
  end

  it "should validate password lenght" do
    user.password = "wg"
    user.valid?
    expect(user.errors[:password].size).to be 1
    expect(user).to be_invalid

    user.password = "kavya123"
    user.valid?
    expect(user.errors[:password].size).to be 0
    expect(user).to be_valid
  end
end