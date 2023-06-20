class CreateSellBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :sell_books do |t|
      t.integer :book_id, null: false
      t.integer :user_id, null: false
      t.integer :price, null: false
      t.integer :shipping_date, null: false
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
