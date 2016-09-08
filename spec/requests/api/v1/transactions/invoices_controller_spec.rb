require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, :type => :request do

  describe "GET #show" do
    it "returns an invoice provided a transaction id" do
      invoice = create(:invoice, id: 8)
      transaction = create(:transaction, id: 4, invoice_id: invoice.id)

      get '/api/v1/transactions/4/invoice'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to eq(invoice.id)
    end
  end
end
