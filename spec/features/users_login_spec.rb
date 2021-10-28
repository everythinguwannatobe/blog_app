require 'rails_helper'

RSpec.feature "Users Logins", type: :feature do
  describe "user login procedure" do
    it "login with invalid information" do
      visit login_path
      fill_in "Email", with: ""
      fill_in "Password", with: ""
      click_button "Log in"

      expect(page).to have_content("Invalid email/password combination")

    end
  end
end
