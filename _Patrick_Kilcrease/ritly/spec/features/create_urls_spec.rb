require 'rails_helper'

feature "CreateUrls", :type => :feature do
  
	scenario "User creates new Ritly link" do 
		visit "/urls/new"

		fill_in "link", with: "http://www.google.com"

		click_button "Create URL"

		expect(page).to have_text("http://www.google.com")
	end


end
