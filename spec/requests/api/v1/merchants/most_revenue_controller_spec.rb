require 'rails_helper'

RSpec.describe Api::V1::Merchants::MostRevenueController, :type => :request do

  describe "GET #show" do
    it "returns the top x merchants ranked by total revenue" do
      merchant  = create(:merchant, id: 1)
      merchant2 = create(:merchant, id: 2, name: "Schroeder-Jerde")
      merchant3 = create(:merchant, id: 3, name: "Willms and Sons")
      
      invoice  = create(:invoice, id: 1, merchant_id: merchant.id)
      invoice2 = create(:invoice, id: 2, merchant_id: merchant2.id)
      invoice3 = create(:invoice, id: 3, merchant_id: merchant3.id)
      
      create(:invoice_item, invoice_id: invoice.id, unit_price: 9000, quantity: 1)
      create(:transaction, invoice_id: invoice.id, result: "success")
      create(:invoice_item, invoice_id: invoice2.id, unit_price: 9000, quantity: 2)
      create(:transaction, invoice_id: invoice2.id, result: "success")
      create(:invoice_item, invoice_id: invoice3.id, unit_price: 5000, quantity: 2)
      create(:transaction, invoice_id: invoice3.id, result: "success")
      
      

      get '/api/v1/merchants/most_revenue?quantity=2'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(2)
      expect(content.first['name']).to eq("Schroeder-Jerde")
      expect(content.second['name']).to eq("Willms and Sons")
    end
  end
end