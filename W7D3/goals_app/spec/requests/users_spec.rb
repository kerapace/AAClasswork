require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "should render the index page" do
        get :index
        expect(response).to render_template(:index)
    end 
  end

  describe "GET /new" do 
    it "should render the new user's template" do 
      get :new 
      expect(response).to render_template(:new)
    end
  end

  describe "POST /create" do 
    context "with valid params" do 
      it "should redirect user to user's index on success" do 
        post :create, params: {user: {username: "Test", password: "testing"}}
        expect(response).to redirect_to(users_url)
      end
    end
    context "with invalid params" do 
      it "validates the presence of username and password" do 
        post :create, params: {user: {username: "Test", password: nil}}
        expect(response).to render_template(:new)
        should set_flash.now[:errors]
      end
      it "validates that the password is atleast 6 characters long" do 
        post :create, params: {user: {username: "Test", password: "cat"}}
        expect(response).to render_template(:new)
        should set_flash.now[:errors]
      end
    end
  end

end
