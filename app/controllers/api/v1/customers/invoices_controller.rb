class Api::V1::Customers::InvoicesController < ApplicationController
  respond_to :json

  def index
    invoices = Customer.find(params[:id]).invoices
    respond_with invoices
  end
end
