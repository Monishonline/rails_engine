class Api::V1::Merchants::RandomController < Api::V1::BaseController
  respond_to :json 

  def show
    merchant = random(Merchant)
    respond_with merchant
  end
end
