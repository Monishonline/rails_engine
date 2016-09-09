require 'rails_helper'

RSpec.describe Api::V1::Merchants::SoldItemsController, :type => :request do

  describe "GET #show" do
    it "returns the revenue of a merchant" do
      merchant  = create(:merchant, id: 1)
      merchant2  = create(:merchant, id: 2, name: "Morar-Hettinger")
      
      invoice  = create(:invoice, id: 1, merchant_id: merchant.id)
      invoice2 = create(:invoice, id: 2, merchant_id: merchant2.id)
      
      create(:invoice_item, invoice_id: invoice.id, quantity: 10)
      create(:transaction, invoice_id: invoice.id, result: "success")
      
      create(:invoice_item, invoice_id: invoice2.id,  quantity: 100)
      create(:transaction, invoice_id: invoice2.id, result: "success")
      
      get '/api/v1/merchants/most_items?quantity=1'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content.count).to eq(1)
      expect(content.first['name']).to eq("Morar-Hettinger")
    end
  end
end