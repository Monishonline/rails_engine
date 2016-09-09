require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, :type => :request do

  describe "GET #index" do
    it "returns all items associated with a merchant" do
      merchant = create(:merchant, id: 2)
      create(:item, merchant_id: merchant.id)
      create(:item, merchant_id: merchant.id)

      get '/api/v1/merchants/2/items'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(2)
    end
  end
end
