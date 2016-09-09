class Api::V1::InvoiceItems::SearchController < ApplicationController
  respond_to :json

  def index
    invoice_items = InvoiceItem.where(search_params)
    respond_with invoice_items
  end

  def show
    invoice_item = InvoiceItem.find_by(search_params)
    respond_with invoice_item
  end

  private

    def search_params
      params.permit(:id,
                    :quantity,
                    :unit_price,
                    :created_at,
                    :updated_at,
                    :invoice_id,
                    :item_id
                    )
    end
end
