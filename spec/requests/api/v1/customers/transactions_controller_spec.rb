require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, :type => :request do

  describe "GET #index" do
    it "returns all the transactions associated with an customer" do
      customer = create(:customer, id: 8)
      invoice = create(:invoice, customer_id: customer.id)
      transaction = create(:transaction, id: 1, invoice_id: invoice.id)
      transaction = create(:transaction, id: 2, invoice_id: invoice.id)
      transaction = create(:transaction, id: 3, invoice_id: invoice.id)

      get '/api/v1/customers/8/transactions'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content.count).to eq(3)
      expect(content.first['id']).to eq(1)
      expect(content.second['id']).to eq(2)
      expect(content.last['id']).to eq(3)
    end
  end
end
