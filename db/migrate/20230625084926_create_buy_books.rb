class CreateBuyBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :buy_books do |t|
      t.integer :sell_book_id, null: false
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.integer :payment_method, null: false
      t.timestamps
    end
  end
end
