class Api::V1::TransactionsController < ApplicationController

def create
  @transaction = Transaction.new(transactions_params)
  if @transaction.valid?
    @transaction.save
    @user = User.find_by(id: transactions_params[:user_id])
    @deduction = transactions_params[:quantity] * transactions_params[:price]
    @user.balance -= @deduction
    @user.save
    render json: {transaction: @transaction, balance: @user.balance}, status: :created
  else
    render json: {error: 'transaction failed'}, status: :not_acceptable
  end
end


private

def transactions_params
  params.require(:transaction).permit(:user_id, :ticker, :quantity, :price)
end

end
