class Category < ActiveRecord::Base
  has_many :bookmark_categories
  has_many :bookmarks, through: :bookmark_categories

  has_many :category_users
  has_many :users, through: :category_users
end
