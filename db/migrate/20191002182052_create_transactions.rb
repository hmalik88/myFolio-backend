class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string "ticker"
      t.integer "quantity"
      t.integer "user_id"
      t.float "price"
      t.timestamps
    end
  end
end
