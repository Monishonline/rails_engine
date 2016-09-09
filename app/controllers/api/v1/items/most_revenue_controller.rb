class Api::V1::Items::MostRevenueController < ApplicationController
  respond_to :json

  def show
    items = Item.most_revenue(params[:quantity])
    respond_with items
  end
end
