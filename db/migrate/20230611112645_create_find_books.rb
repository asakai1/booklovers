class CreateFindBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :find_books do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :payment_method
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
