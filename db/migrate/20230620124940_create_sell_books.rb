class CreateSellBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :sell_books do |t|
      t.integer :title, null: false
      t.integer :user_id, null: false
      t.integer :price, null: false
      t.integer :shipping_date, null: false
      t.timestamps
    end
  end
end
