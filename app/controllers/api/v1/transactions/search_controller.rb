class Api::V1::Transactions::SearchController < ApplicationController
  respond_to :json

  def index
    transactions = Transaction.where( search_params )
    respond_with transactions
  end

  def show
    transaction = Transaction.find_by( search_params )
    respond_with transaction
  end

  private

    def search_params
      params.permit(:id, :credit_card_number, :result, :invoice_id, :created_at, :updated_at)
    end
end
