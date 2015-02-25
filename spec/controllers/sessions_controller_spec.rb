require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let(:user) {FactoryGirl.create(:user)}

  it "should create a session for valid user" do
    user_params = {
      user: {
        email: user.email,
        password: user.password
      }
    }
    session[:user_id] = nil
    post :create, user_params
    expect(session[:user_id]).to be user.id
  end

  it "should delete a session for valid user" do
    session[:user_id] = user.id
    delete :destroy, :id => user.id
    expect(session[:user_id]).to be nil
  end

end