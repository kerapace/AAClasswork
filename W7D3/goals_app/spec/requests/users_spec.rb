require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
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
    let(:user_params) do
      {username: "Test", password: "testing"}
    end
    context "with valid params" do 
      it "should redirect user to their userpage on success" do 
        post :create, params: {user: {username: "Test", password: "testing"}}
        user = User.find_by(username: "Test")
        expect(response).to render_template(:new)
      end

      it "should log in the user" do
        post :create, params: {user: {username: "Test", password: "testing"}}
        
        user = User.find_by(username: "Test")
        expect(session['session_token']).to eq(user.session_token)
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

  before(:all) {
    user = User.new(username: "alisonwonderland", password: "palindromordnilap")
    user.save
  }
  describe "GET /show" do
    it "should show a specific user's userpage" do
      user = User.find_by(username: "alisonwonderland")
      get :show, params: {id: user.id}
      expect(response).to render_template(:show)
    end
  end
end
