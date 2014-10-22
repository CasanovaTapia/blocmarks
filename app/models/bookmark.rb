class Bookmark < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_many :bookmark_categories
  has_many :categories, through: :bookmark_categories

  default_scope { order('created_at DESC') }

  attr_accessor :sorted_categories

  # validates :title, presence: true
  validates :url, presence: true

  def self.tagged_with(name)
    Category.find_by_name!(name).bookmarks
  end
end
