class Api::V1::TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.transaction_date = Time.new
    @transaction.user_id = params[:user_id]
    @transaction.latitude = params[:transaction][:latitude]
    @transaction.longitude = params[:transaction][:longitude]
    @transaction.amount = params[:transaction][:amount]
    create_entity(@transaction)
  end

  def serializer
    TransactionSerializer
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_date, :amount, :user_id, :longitude, :latitude)
  end

end