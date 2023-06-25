class CreateFindBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :find_books do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
