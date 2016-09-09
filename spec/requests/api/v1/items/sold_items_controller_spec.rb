require 'rails_helper'

RSpec.describe Api::V1::Items::SoldItemsController, :type => :request do

  describe "GET #show" do
    it "returns the top x items ranked by total revenue" do
      item  = create(:item, id: 1)
      item2 = create(:item, id: 2, name: "Bronze Statue")
      item3 = create(:item, id: 3, name: "Silver Platter")

      invoice  = create(:invoice, id: 1)
      invoice2 = create(:invoice, id: 2)
      invoice3 = create(:invoice, id: 3)

      create(:invoice_item, invoice_id: invoice.id, item_id: item.id, unit_price: 9000, quantity: 1)
      create(:transaction, invoice_id: invoice.id, result: "success")
      create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, unit_price: 9000, quantity: 2)
      create(:transaction, invoice_id: invoice2.id, result: "success")
      create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id, unit_price: 5000, quantity: 2)
      create(:transaction, invoice_id: invoice3.id, result: "success")

      get '/api/v1/items/most_items?quantity=2'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(2)
      expect(content.first['name']).to eq("Bronze Statue")
      expect(content.second['name']).to eq("Silver Platter")
    end
  end
end
