class Api::V1::Merchants::SoldItemsController < ApplicationController
  respond_to :json

  def show
    ranked_merchants = Merchant.most_items(params[:quantity])
    respond_with ranked_merchants
  end
end
