require 'rails_helper'

RSpec.describe IncomingController, :type => :controller do
  describe "POST" do

    before do
      FactoryGirl.create(:user)

      post :create, sender: "test@example.com", subject: "#category", :'stripped-text' => "http://example.com"
      @bookmark = Bookmark.last
    end

    it "should receive params" do
      expect(@bookmark.user.email).to eq("test@example.com")
      expect(@bookmark.categories.first.name).to eq("category")
      expect(@bookmark.url).to eq("http://example.com")
    end
  end
end
