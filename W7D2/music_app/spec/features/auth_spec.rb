require 'rails_helper'

feature "the signup process" do

    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content("Register")
    end
  
    feature "signing up a user" do
      before(:each) do
        visit new_user_url
        fill_in 'email', :with => "testing@email.com"
        fill_in 'password', :with => "biscuits"
        click_on "Register"
      end
  
      scenario "redirects to bands index page after signup" do
        expect(page).to have_content("Band Index")
      end
    end
  
    feature "with an invalid user" do
      before(:each) do
        visit new_user_url
        fill_in 'email', :with => "testing@email.com"
        click_on "Register"
      end
  
      scenario "re-renders the signup page after failed signup" do
        expect(page).to have_content("Register")
      end
    end
  
  end