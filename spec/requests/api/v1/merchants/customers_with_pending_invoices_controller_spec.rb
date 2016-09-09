require 'rails_helper'

RSpec.describe Api::V1::Merchants::CustomersWithPendingInvoicesController, :type => :request do

  describe "GET #show" do
    it "returns a collection of customers which have pending (unpaid) invoices" do
      merchant   = create(:merchant, id: 10)
      customer   = create(:customer, id: 1, first_name: "Tom")
      customer2  = create(:customer, id: 2, first_name: "Joey")
      customer3  = create(:customer, id: 3, first_name: "Mary")
      
      invoice  = create(:invoice, id: 1, customer_id: customer.id, merchant_id: merchant.id)
      invoice2  = create(:invoice, id: 2, customer_id: customer2.id, merchant_id: merchant.id)
      invoice3  = create(:invoice, id: 3, customer_id: customer3.id, merchant_id: merchant.id)
      
      create(:invoice_item, invoice_id: invoice.id)
      create(:transaction, invoice_id: invoice.id, result: "success")
      
      create(:invoice_item, invoice_id: invoice2.id)
      create(:transaction, invoice_id: invoice2.id, result: "failed")
      
      create(:invoice_item, invoice_id: invoice3.id)
      create(:transaction, invoice_id: invoice3.id, result: "failed")
      
      get '/api/v1/merchants/10/customers_with_pending_invoices'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content.count).to eq(2)
      expect(content.first['first_name']).to eq("Joey")
      expect(content.second['first_name']).to eq("Mary")
    end
  end
end