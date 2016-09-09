class Api::V1::Merchants::MostRevenueController < ApplicationController
  respond_to :json

  def show
    merchants = Merchant.most_revenue(params[:quantity])
    respond_with merchants
  end
end
