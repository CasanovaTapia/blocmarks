class Bookmark < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :bookmarks_categories
  has_many :categories, through: :bookmarks_categories

  validates :title, presence: true
  validates :url, presence: true
end
