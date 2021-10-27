require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe "creation" do
    it "valid with valid attributes" do
      expect(@user).to be_valid
    end
  end

  describe "name validation" do
    it "invalid with missing name" do
      @user.name = ""
      expect(@user).to_not be_valid
    end

    it "validates name length" do
      @user.name = "a" * 51
      expect(@user).to_not be_valid
    end
  end

  describe "email validation" do
    it "invalid with missing email" do
      @user.email = ""
      expect(@user).to_not be_valid
    end

    it "validates email length" do
      @user.email = ("a" * 260) + "@example.com"
      expect(@user).to_not be_valid
    end

    it "validates email format" do
      @user.email = "USER@example.com"
      expect(@user).to be_valid
    end
  end
end
