class Bookmark < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true
end
