require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, :type => :request do

  describe "GET #index" do
    it "returns all merchants in index" do
      merchant = create_list(:merchant, 3)

      get '/api/v1/merchants'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(3)
      expect(content.first['name']).to eq(merchant.first.name)
    end
  end

  describe "GET #show" do
    it "returns a merchant by id" do
      merchant = create(:merchant, id: 4)

      get '/api/v1/merchants/4'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to eq(4)
      expect(content['name']).to eq(merchant.name)
    end
  end
end
