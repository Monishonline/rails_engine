class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json

  def show
    invoice = Invoice.order("RANDOM()").take
    respond_with invoice
  end
end
