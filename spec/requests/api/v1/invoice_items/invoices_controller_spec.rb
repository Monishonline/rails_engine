require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoicesController, :type => :request do

  describe "GET #show" do
    it "returns the invoice of a specific invoice_item" do
      invoice = create(:invoice, id: 6)
      create(:invoice_item, id: 1, invoice_id: invoice.id)

      get '/api/v1/invoice_items/1/invoice'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['id']).to eq(6)
    end
  end
end
