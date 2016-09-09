class Api::V1::Customers::RandomController < Api::V1::BaseController
  respond_to :json

  def show
    customer = random(Customer)
    respond_with customer
  end
end
