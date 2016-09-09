class Api::V1::Items::RandomController < Api::V1::BaseController
  respond_to :json

  def show
    item = random(Item)
    respond_with item
  end
end
