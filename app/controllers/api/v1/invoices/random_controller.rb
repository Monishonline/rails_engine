class Api::V1::Invoices::RandomController < Api::V1::BaseController
  respond_to :json

  def show
    invoice = random(Invoice)
    respond_with invoice
  end
end
