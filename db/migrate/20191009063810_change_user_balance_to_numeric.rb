class ChangeUserBalanceToNumeric < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :balance, :numeric, precision: 8, scale: 2
  end
end
