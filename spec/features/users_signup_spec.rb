require "rails_helper"
RSpec.feature "Users Signups", type: :feature do
  describe "User signup procedure" do
    before do
      @user = create(:user)
    end

    it "test for invalid name" do
      visit signup_path
      fill_in "Name", with: ""
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "foobar"
      fill_in "Confirmation", with: "foobar"
      click_button "Create my account"
      # visit users_path
      expect(page).to have_content("Name can't be blank")
    end

    it "test for invalid email" do
      visit signup_path
      fill_in "Name", with: "Test User"
      fill_in "Email", with: "test@test"
      fill_in "Password", with: "foobar"
      fill_in "Confirmation", with: "foobar"
      click_button "Create my account"

      expect(page).to have_content("Email is invalid")
    end

    it "test for password too short" do
      visit signup_path
      fill_in "Name", with: "Test User"
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "foo"
      fill_in "Confirmation", with: "bar"
      click_button "Create my account"

      expect(page).to have_content("Password is too short")
    end

    it "test for invalid password_confirmation" do
      visit signup_path
      fill_in "Name", with: "Test User"
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "foobar"
      fill_in "Confirmation", with: "bar"
      click_button "Create my account"

      expect(page).to have_content("Password confirmation doesn't match")
    end

    it "test for missing password_confirmation" do
      visit signup_path
      fill_in "Name", with: "Test User"
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "foobar"
      fill_in "Confirmation", with: ""
      click_button "Create my account"

      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
