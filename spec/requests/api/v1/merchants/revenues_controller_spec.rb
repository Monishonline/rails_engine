require 'rails_helper'

RSpec.describe Api::V1::Merchants::RevenuesController, :type => :request do

  describe "GET #index" do
    it "returns total revenue of a merchant by date" do
      merchant = create(:merchant, id: 5)

      invoice  = create(:invoice, id: 1, merchant_id: merchant.id, created_at: "2012-03-16 11:55:05")
      invoice2 = create(:invoice, id: 2, merchant_id: merchant.id, created_at: "2012-03-16 11:55:05")

      create(:invoice_item, invoice_id: invoice.id, unit_price: 9000, quantity: 1)
      create(:transaction, invoice_id: invoice.id, result: "success")

      create(:invoice_item, invoice_id: invoice2.id, unit_price: 5000, quantity: 2)
      create(:transaction, invoice_id: invoice2.id, result: "success")

      get '/api/v1/merchants/revenue?date=2012-03-16 11:55:05'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content).to eq({"total_revenue"=>"190.0"})
    end
  end

  describe "GET #show" do
    it "returns the revenue of a merchant by id" do
      merchant = create(:merchant, id: 5)

      invoice  = create(:invoice, id: 1, merchant_id: merchant.id)
      invoice2 = create(:invoice, id: 2, merchant_id: merchant.id)

      create(:invoice_item, invoice_id: invoice.id, unit_price: 9000, quantity: 1)
      create(:transaction, invoice_id: invoice.id, result: "success")

      create(:invoice_item, invoice_id: invoice2.id, unit_price: 5000, quantity: 2)
      create(:transaction, invoice_id: invoice2.id, result: "success")

      get '/api/v1/merchants/5/revenue'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content).to eq({"revenue"=>"190.0"})
    end
  end
end
