class Api::V1::Merchants::SearchController < ApplicationController
  respond_to :json
  
  def index
    merchants = Merchant.where( search_params )
    respond_with merchants
  end

  def show
    merchant = Merchant.find_by( search_params )
    respond_with merchant
  end

  private

    def search_params
      params.permit(:id, :name, :created_at, :updated_at)  
    end
end

