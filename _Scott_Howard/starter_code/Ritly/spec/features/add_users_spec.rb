require 'rails_helper'

feature "AddUsers", :type => :feature do
  scenario "User signs up" do
  	visit "/users/new"

  	fill_in "user_username", with: 'testuser'
  	fill_in "user_password", with: 'testpass'

  	click_button "Create User"

  	expect(page).to have_text("Welcome back")
  end

end
