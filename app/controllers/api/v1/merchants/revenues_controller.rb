class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    merchant_revenue = Merchant.find(params[:id]).revenue
    respond_with merchant_revenue
  end
end
