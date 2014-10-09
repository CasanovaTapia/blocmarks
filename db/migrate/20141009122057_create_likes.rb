class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :bookmark, index: true

      t.timestamps
    end

    add_index :users, :id, unique: true
    add_index :bookmarks, :id, unique: true
    add_index :likes, :id, unique: true
  end
end
