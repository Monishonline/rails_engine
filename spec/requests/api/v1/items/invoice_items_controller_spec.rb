require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, :type => :request do

  describe "GET #index" do
    it "returns all the invoice_items associated with a specific item" do
      item = create(:item, id: 1, name: "Item Qui Esse")
      item2 = create(:item, id: 4, name: "Item Autem Minima")
      create(:invoice_item, id: 1, item_id: item.id)
      create(:invoice_item, id: 2, item_id: item.id)
      create(:invoice_item, id: 3, item_id: 4)

      get '/api/v1/items/1/invoice_items'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content.count).to eq(2)
      expect(content.first['id']).to eq(1)
      expect(content.second['id']).to eq(2)
    end
  end
end