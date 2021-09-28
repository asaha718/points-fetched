class TransactionsController < ApplicationController
  def create
    render json: Transaction.create(transactions_params)
  end

  def index
    group_of_payers= Transaction.select(:payer, "SUM(points) as points").group(:payer); 

    results={}

    group_of_payers.each do |group|
      results[group.payer] = group.points 
    end

    render json: results
  end

  def spend
    points_to_spend= params[:points].to_i
    spent_points={}
    if Transaction.pluck(:points).sum > points_to_spend
      Transaction.order(timestamp: :asc).each do |transaction|
        if transaction.points < points_to_spend
          points_to_spend -= transaction.points
          spent_points[transaction.payer] = (spent_points[transaction.payer] || 0) - transaction.points
          transaction.destroy
        else 
          spent_points[transaction.payer] = (spent_points[transaction.payer] || 0) - points_to_spend
          transaction.update(points: transaction.points- points_to_spend)
          break
        end
      end

      result=[]; 
      
      spent_points.each do |key, value|
        result << {"payer" => key , "points" => value}
      end
      render json: result
    end
  end
  
  private

  def transactions_params
    params.require(:transactions).permit(:payer, :points, :timestamp)
  end
end
