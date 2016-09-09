require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, :type => :request do

  describe "GET #index" do
    it "returns all invoices" do
      item = create_list(:invoice, 3)

      get '/api/v1/invoices'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(3)
    end
  end

  describe "GET #show" do
    it "returns an invoice by id" do
      invoice = create(:invoice, id: 2)

      get '/api/v1/invoices/2'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to eq(2)
      expect(content['status']).to eq(invoice.status)
      expect(content['merchant_id']).to eq(invoice.merchant_id)
      expect(content['customer_id']).to eq(invoice.customer_id)
    end
  end
end