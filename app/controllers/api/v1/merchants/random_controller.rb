class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.order("RANDOM()").take
    respond_with merchant
  end
end
