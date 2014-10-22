class CategoryUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
end
