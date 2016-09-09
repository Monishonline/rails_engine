class Api::V1::Items::SearchController < ApplicationController
  respond_to :json

  def index
    items = Item.where(search_params)
    respond_with items
  end

  def show
    item = Item.find_by(search_params)
    respond_with item
  end

  private

    def search_params
      params.permit(:id,
                    :name,
                    :description,
                    :unit_price,
                    :created_at,
                    :updated_at,
                    :merchant_id
                    )
    end
end
