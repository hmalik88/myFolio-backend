class Api::V1::TransactionsController < ApplicationController

def create
  @transaction = Transaction.new(transaction_params)
end


private

def transactions_params
  params.require(:transaction).permit(:user_id, :ticker, :quantity, :price)
end

end
