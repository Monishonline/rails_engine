require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, :type => :request do

  describe "GET #index" do
    it "returns all invoice_items" do
      invoice_items = create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'
      expect(response).to be_success

      json = JSON.parse(response.body)
      expect(json.count).to eq(3)
    end
  end

  describe "GET #show" do
    it "returns an invoice_item by id" do
      invoice_item = create(:invoice_item, id: 2)

      get '/api/v1/invoice_items/2'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to eq(2)
      expect(content['invoice_id']).to eq(invoice_item.invoice_id)
      expect(content['item_id']).to eq(invoice_item.item_id)
      expect(content['quantity']).to eq(invoice_item.quantity)
      expect(content['unit_price']).to eq(invoice_item.unit_price.to_s)
    end
  end
end