class CreateSuggestBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :suggest_books do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.string :author
      t.text :body, null: false
      t.timestamps
    end
  end
end
