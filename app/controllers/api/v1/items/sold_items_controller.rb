class Api::V1::Items::SoldItemsController < ApplicationController
  respond_to :json

  def show
    ranked_items = Item.most_items(params[:quantity])
    respond_with ranked_items
  end
end
