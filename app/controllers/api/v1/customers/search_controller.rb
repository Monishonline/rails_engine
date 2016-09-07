class Api::V1::Customers::SearchController < ApplicationController
  respond_to :json

  def index
    customers = Customer.where( search_params )
    respond_with customers
  end

  def show
    customer = Customer.find_by( search_params )
    respond_with customer
  end

  private

    def search_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end

