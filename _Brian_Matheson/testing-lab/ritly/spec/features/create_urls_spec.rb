require 'rails_helper'

feature "CreateUrls", :type => :feature do

  scenario "User creates a new entry" do
    visit "/urls/new"
    fill_in 'URL To Shorten:', with: "http://www.google.com"
    click_button 'Create URL'
    assert page.has_content? "google.com"
  end
end
