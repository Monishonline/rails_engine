class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json

  def show
    customer = Merchant.order("RANDOM()").take
    respond_with customer
  end
end

