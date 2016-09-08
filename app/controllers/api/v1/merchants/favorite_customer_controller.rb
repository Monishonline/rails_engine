class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json

  def show
    customer = Merchant.find(params[:id]).favorite_customer
    respond_with customer
  end
end
