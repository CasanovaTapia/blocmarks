class CreateCategoryUsers < ActiveRecord::Migration
  def change
    create_table :category_users do |t|
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
