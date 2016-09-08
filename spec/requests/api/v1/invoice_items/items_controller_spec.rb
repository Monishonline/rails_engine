require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, :type => :request do

  describe "GET #show" do
    it "returns the item associated with an invoice_item" do
      item = create(:item, id: 1, name: "Item Qui Esse")
      create(:invoice_item, id: 2, item_id: item.id)

      get '/api/v1/invoice_items/2/item'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['name']).to eq("Item Qui Esse")
      expect(content['id']).to eq(1)
    end
  end
end