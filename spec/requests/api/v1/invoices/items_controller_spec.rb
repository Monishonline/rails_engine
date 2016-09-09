require 'rails_helper'

RSpec.describe Api::V1::Invoices::ItemsController, :type => :request do

  describe "GET #index" do
    it "returns all items associated with an invoice" do
      invoice = create(:invoice, id: 8)
      invoice_item1 = create(:invoice_item, id: 1, invoice_id: 8)
      invoice_item2 = create(:invoice_item, id: 2, invoice_id: 8)
      invoice_item3 = create(:invoice_item, id: 3, invoice_id: 8)

      get '/api/v1/invoices/8/items'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content.count).to eq(3)
    end
  end
end