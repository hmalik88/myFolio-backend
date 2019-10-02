class Api::V1::TransactionsController < ApplicationController

def create
  @transaction = Transaction.new(transaction_params)
  if @transaction.valid?
    @transaction.save
    render json: {transaction: @transaction}, status: :created
  else
    render json: {error: 'transaction failed'}, status: :not_acceptable
  end
  @user = User.find_by(id: transaction_params[:user_id])
  @deduction = transaction_params[:quantity] * transaction_params[:price]
  @user.balance -= @deduction
  @user.save
end


private

def transactions_params
  params.require(:transaction).permit(:user_id, :ticker, :quantity, :price)
end

end
