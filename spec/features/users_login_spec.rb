require "rails_helper"

RSpec.feature "Users Logins", type: :feature do

  describe "user login procedure" do
    before do
      @user = create(:user)
    end

    def login_user(user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    it "login with invalid information" do
      visit login_path
      fill_in "Email", with: ""
      fill_in "Password", with: ""
      click_button "Log in"

      expect(page).to have_content("Invalid email/password combination")

    end

    it "login with valid email/invalid password" do
      visit login_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: "invalid"
      click_button "Log in"

      expect(page).to have_content("Invalid email/password combination")
    end

    it "login with invalid email/valid password" do
      visit login_path
      fill_in "Email", with: "test@slash.com"
      fill_in "Password", with: @user.password
      click_button "Log in"

      expect(page).to have_content("Invalid email/password combination")
    end

    it "valid login" do
      visit login_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      click_button "Log in"
    end

    it "valid logout" do
      login_user(@user)

      click_link "Account"
      click_button "Log out"
    end
  end
end
