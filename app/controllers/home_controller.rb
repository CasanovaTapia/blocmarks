class HomeController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @categories = Category.all
  end
end
