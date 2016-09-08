class Api::V1::Customers::MerchantsController < ApplicationController
  respond_to :json

  def show
    # merchant = Customer.find(params[:id]).favorite_merchant
    # byebug
    # respond_with merchant
  end
end
