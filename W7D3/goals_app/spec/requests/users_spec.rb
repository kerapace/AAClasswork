require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "should render the index page" do
        get :index
        expect(page).to render(:index)
    end

    it "should store users in an instance variable" do
      
    end
  end
end
