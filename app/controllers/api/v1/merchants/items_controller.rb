class Api::V1::Merchants::ItemsController < ApplicationController
  respond_to :json

  def index
    items = Merchant.find(params[:id]).items
    respond_with items
  end
end
