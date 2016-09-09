require 'rails_helper'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, :type => :request do

  describe "GET #index" do
    it "returns all invoice items associated with a specific invoice" do
      invoice = create(:invoice, id: 1)
      create(:invoice_item, id: 3, invoice_id: invoice.id)
      create(:invoice_item, id: 4, invoice_id: invoice.id)

      get '/api/v1/invoices/1/invoice_items'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content.count).to eq(2)
      expect(content.first['id']).to eq(3)
      expect(content.second['id']).to eq(4)
    end
  end
end
