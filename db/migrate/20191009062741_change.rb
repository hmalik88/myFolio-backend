class Change < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :balance, :decimal, precision: 8, scale: 2
  end
end
