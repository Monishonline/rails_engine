class Api::V1::Invoices::SearchController < ApplicationController
  respond_to :json

  def index
    invoices = Invoice.where(search_params)
    respond_with invoices
  end

  def show
    invoice = Invoice.find_by(search_params)
    respond_with invoice
  end

  private

    def search_params
      params.permit(:id,
                    :status,
                    :created_at,
                    :updated_at,
                    :customer_id,
                    :merchant_id
                    )
    end
end
