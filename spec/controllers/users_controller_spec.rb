require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}

  describe "GET create" do
    it "should create a user" do
      user_params = {
        user: {
          name: "user name",
          email: "email@yopmail.com",
          password: "pass123",
          password_confirmation: "pass123"
        }
      }
      expect do
        post :create, user_params
      end.to change(User, :count).by(1)
    end
  end
end