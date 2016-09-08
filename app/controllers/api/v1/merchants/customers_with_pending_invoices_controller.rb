class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  respond_to :json

  def index
    customers_pending = Merchant.find(params[:id]).customers
    respond_with customers_pending
  end
end
