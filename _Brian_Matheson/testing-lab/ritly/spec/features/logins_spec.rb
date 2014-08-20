require 'rails_helper'

feature "Logins", :type => :feature do
  let!(:user) { User.create_with_password('bla', 'secretbla') }

  scenario "User logs in" do
    visit "/sessions/new"

    fill_in "username", with: 'bla'
    fill_in "password", with: 'secretbla'

    click_button "Login"

    expect(page).to have_text("Welcome back bla!")
  end

  scenario "Invlalid username or password" do
    visit "/sessions/new"

    fill_in "username", with: 'bla'
    fill_in "password", with: 'fehjhkeh'

    click_button "Login"

    expect(page).to have_text("Invalid username or password.")
  end

end
