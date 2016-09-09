require 'rails_helper'

RSpec.describe Api::V1::Merchants::FavoriteCustomerController, :type => :request do

  describe "GET #show" do
    it "returns a merchant where the customer has conducted the most successful transactions" do
      merchant   = create(:merchant, id: 15)
      customer   = create(:customer, id: 1, first_name: "Tom")
      customer2  = create(:customer, id: 2, first_name: "Joey")
      
      invoice  = create(:invoice, id: 1, customer_id: customer.id, merchant_id: merchant.id)
      invoice2  = create(:invoice, id: 2, customer_id: customer2.id, merchant_id: merchant.id)
      invoice3  = create(:invoice, id: 3, customer_id: customer2.id, merchant_id: merchant.id)
      
      create(:invoice_item, invoice_id: invoice.id)
      create(:transaction, invoice_id: invoice.id, result: "success")
      
      create(:invoice_item, invoice_id: invoice2.id)
      create(:transaction, invoice_id: invoice2.id, result: "sucess")
      
      create(:invoice_item, invoice_id: invoice3.id)
      create(:transaction, invoice_id: invoice3.id, result: "success")
      
      get '/api/v1/merchants/15/favorite_customer'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['first_name']).to eq("Joey")
    end
  end
end