require 'rails_helper'

RSpec.describe Api::V1::Merchants::SearchController, :type => :request do

  describe "GET #index" do
    it "finds all transactions" do
      merchants = FactoryGirl.create_list(:merchant, 4)

      get '/api/v1/merchants/find_all'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(4)
      expect(content.first['name']).to eq(merchants.first.name)
    end
  end

  describe "GET #show" do
    it "returns a merchant by id" do
      merchant = FactoryGirl.create(:merchant, id: 8)

      get '/api/v1/merchants/find?id=8'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to_not eq(3)
      expect(content['id']).to eq(8)
    end

    it "returns a merchant by name" do
      merchant = FactoryGirl.create(:merchant, name: "Business and Co")

      get '/api/v1/merchants/find?first_name=Business and Co'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['name']).to eq("Business and Co")
    end

    it "returns a merchant by created_at" do
      merchant = FactoryGirl.create(:merchant, created_at:"2012-03-27T14:54:10.000Z")

      get '/api/v1/merchants/find?created_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['created_at']).to eq("2012-03-27T14:54:10.000Z")
    end

    it "returns a merchant by updated_at" do
      merchant = FactoryGirl.create(:merchant, updated_at:"2012-03-27T14:54:10.000Z")

      get '/api/v1/merchants/find?updated_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['updated_at']).to eq("2012-03-27T14:54:10.000Z")
    end
  end
end
