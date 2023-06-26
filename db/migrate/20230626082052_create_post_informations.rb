class CreatePostInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_informations do |t|
      t.text :information, null: false
      t.integer :user_id, null: false
      t.integer :find_book_id, null: false

      t.timestamps
    end
  end
end
