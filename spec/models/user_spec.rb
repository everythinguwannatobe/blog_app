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

    it "validates email is unique" do
      duplicate_user = @user.dup
      expect(duplicate_user).to_not be_valid
    end

    it "validates email saved as lower-case" do
      mixed_case_email = "FOO@example.COM"
      @user.email = mixed_case_email
      @user.save
      expect(@user).to be_valid
    end

    it "validates email format" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]

      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
      end
    end
  end

  describe "password validations" do
    it "password should be present (non-blank)" do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).to_not be_valid
    end

    it "password should be present a minimum length" do
      @user.password = @user.password_confirmation = " " * 5
      expect(@user).to_not be_valid
    end
  end
end
