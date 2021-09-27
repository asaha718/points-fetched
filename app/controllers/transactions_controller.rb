class TransactionsController < ApplicationController
  def create
    render json: Transaction.create(transactions_params)
  end

  def index
    render json: Transaction.select(:name, "SUM(points) AS points").group(:name)
  end

  def spend
  end

  def transactions_params
    params.require(:transactions).permit(:payer, :points, :timestamp)
  end
end
