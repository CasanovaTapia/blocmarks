class Category < ActiveRecord::Base
  has_many :bookmarks_categories
  has_many :bookmarks, through: :bookmarks_categories
end
