class Api::V1::Merchants::MostItemsController < ApplicationController
  respond_to :json

  def show
    x = Merchant.most_items(params[:quantity])
    respond_with x
  end
end
