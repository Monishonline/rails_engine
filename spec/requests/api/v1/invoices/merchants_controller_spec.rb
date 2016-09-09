require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, :type => :request do

  describe "GET #show" do
    it "returns the merchant of a invoice" do
      merchant = create(:merchant, id: 2, name: "Schroeder-Jerde")
      invoice = create(:invoice, id: 8, merchant_id: merchant.id)

      get '/api/v1/invoices/8/merchant'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['name']).to eq("Schroeder-Jerde")
      expect(content['id']).to eq(2)
    end
  end
end