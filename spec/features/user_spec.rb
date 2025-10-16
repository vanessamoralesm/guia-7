require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature "User want to create a new user successfully" do 
    scenario "Create a new user account" do 
    visit new_user_path 
    fill_in "Name", :with => "Pedro" 
    fill_in "Password", :with => "12345678" 
    fill_in "Email", :with => "pedro@gmail.com" 
    click_button "Create User" 
    expect(page).to have_text("User was successfully created") 
    end 
  end 

  feature "User want to see all users created" do 
    scenario "User is on index page" do 
      visit new_user_path 
      click_link "Back" 
      expect(page).to have_content("Users") 
    end 
  end 
end