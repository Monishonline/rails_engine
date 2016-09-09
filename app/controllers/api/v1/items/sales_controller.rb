class Api::V1::Items::SalesController < ApplicationController
  respond_to :json

  def show
    item_best_day = Item.find(params[:id]).best_day
    respond_with item_best_day, serializer: ItemSaleSerializer
  end
end
