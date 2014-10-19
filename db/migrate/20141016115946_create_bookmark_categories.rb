class CreateBookmarkCategories < ActiveRecord::Migration
  def change
    create_table :bookmark_categories do |t|
      t.references :bookmark, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
