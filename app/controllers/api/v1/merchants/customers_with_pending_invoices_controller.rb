class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  respond_to :json

  def show
    customers = Merchant.find(params[:id]).customers_with_pending_invoices
    respond_with customers
  end
end
