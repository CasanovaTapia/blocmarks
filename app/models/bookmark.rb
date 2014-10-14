class Bookmark < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true
end
