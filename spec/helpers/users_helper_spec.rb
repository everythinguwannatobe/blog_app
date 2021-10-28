require "rails_helper"

RSpec.describe UsersHelper, type: :helper do
  describe "string concat" do
    before do
      @user = create(:user)
    end

    it "retrieves user's gravatar" do
      expect(helper.gravatar_for(@user)).to have_css "img"
    end
  end
end
