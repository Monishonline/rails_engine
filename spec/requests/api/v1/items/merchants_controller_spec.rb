require 'rails_helper'

RSpec.describe Api::V1::Items::MerchantsController, :type => :request do

  describe "GET #show" do
    it "returns the merchant of a specific item" do
      merchant = create(:merchant, id: 2, name: "Klein, Rempel and Jones")
      create(:item, id: 1, merchant_id: merchant.id)

      get '/api/v1/items/1/merchant'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['id']).to eq(2)
      expect(content['name']).to eq("Klein, Rempel and Jones")
    end
  end
end