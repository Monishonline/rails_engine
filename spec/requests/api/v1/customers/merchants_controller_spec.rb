require 'rails_helper'

RSpec.describe Api::V1::Customers::MerchantsController, :type => :request do

  describe "GET #show" do
    it "returns a merchant where the customer has conducted the most successful transactions" do
      customer  = create(:customer, id: 1)
      merchant  = create(:merchant, id: 1, name: "Schroeder-Jerde")
      merchant2 = create(:merchant, id: 2)
      
      invoice  = create(:invoice, id: 1, merchant_id: merchant.id, customer_id: customer.id)
      invoice2 = create(:invoice, id: 2, merchant_id: merchant2.id, customer_id: customer.id)
      
      create(:invoice_item, invoice_id: invoice.id)
      create(:transaction, invoice_id: invoice.id, result: "success")
      
      create(:invoice_item, invoice_id: invoice2.id)
      create(:transaction, invoice_id: invoice2.id, result: "failed")

      get '/api/v1/customers/1/favorite_merchant'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['name']).to eq("Schroeder-Jerde")
    end
  end
end