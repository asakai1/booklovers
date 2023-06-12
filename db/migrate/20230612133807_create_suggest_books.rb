class CreateSuggestBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :suggest_books do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :introduction, null: false
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
