class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :likes

  validates :title, presence: true
  validates :url, presence: true
end
