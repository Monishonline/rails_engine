require 'rails_helper'

RSpec.describe Api::V1::Items::SearchController, :type => :request do
  
  describe "GET #index" do
    it "finds all items by unit_price" do
      create(:item, id: 1, unit_price: 18987)
      create(:item, id: 2, unit_price: 18987)
      create(:item, id: 3, unit_price: 80000)
    
      get '/api/v1/items/find_all?unit_price=189.87'
      expect(response).to be_success
    
      content = JSON.parse(response.body)
      expect(content.count).to eq(2)
    end
    
    it "finds all items by merchant_id" do
      merchant  = create(:merchant, id: 1)
      merchant2 = create(:merchant, id: 2)
      create(:item, id: 1, merchant_id: merchant.id)
      create(:item, id: 2, merchant_id: merchant.id)
      create(:item, id: 3, merchant_id: merchant2.id)
  
      get '/api/v1/items/find_all?merchant_id=1'
      expect(response).to be_success
  
      content = JSON.parse(response.body)
      expect(content.count).to eq(2)
    end
  end
  
  describe "GET #show" do
    it "returns an item by id" do
      create(:item, id: 8)
  
      get '/api/v1/items/find?id=8'
      expect(response).to be_success
  
      content = JSON.parse(response.body)
      expect(content['id']).to_not eq(3)
      expect(content['id']).to eq(8)
    end
  
    it "returns an item by description" do
      create(:item, id: 2, description: "newest item")
      create(:item, id: 4, description: "old item")
    
  
      get '/api/v1/items/find?item_id=newest item'
      expect(response).to be_success
  
      content = JSON.parse(response.body)
  
      expect(content['id']).to eq(2)
      expect(content['id']).to_not eq(4)
    end
    
    it "returns an item by merchant_id" do
      merchant  = create(:merchant, id: 1)
      merchant2 = create(:merchant, id: 2)
      create(:item, id: 2, merchant_id: merchant.id)
      create(:item, id: 4, merchant_id: merchant2.id)
  
      get '/api/v1/items/find?merchant_id=1'
      expect(response).to be_success
  
      content = JSON.parse(response.body)
  
      expect(content['id']).to eq(2)
      expect(content['id']).to_not eq(4)
    end
    
    it "returns an item by unit_price" do
      create(:item, id: 1, unit_price: 10090)
      create(:item, id: 2, unit_price: 90008)
  
      get '/api/v1/items/find?unit_price=100.90'
      expect(response).to be_success
  
      content = JSON.parse(response.body)
  
      expect(content['id']).to eq(1)
      expect(content['id']).to_not eq(2)
    end
  
  
    it "returns an item by created_at" do
      create(:item, id: 1, created_at:"2012-03-27T14:54:10.000Z")
      create(:item, id: 2, created_at:"2014-03-27T14:54:10.000Z")
    
      get '/api/v1/items/find?created_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success
    
      content = JSON.parse(response.body)
      expect(content['id']).to eq(1)
      expect(content['id']).to_not eq(2)
      expect(content['created_at']).to eq("2012-03-27T14:54:10.000Z")
    end
    
    it "returns an item by updated_at" do
      create(:item, id: 1, updated_at:"2012-03-27T14:54:10.000Z")
      create(:item, id: 2, updated_at:"2012-03-27T14:54:10.000Z")
    
      get '/api/v1/items/find?updated_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success
    
      content = JSON.parse(response.body)
      expect(content['id']).to eq(1)
      expect(content['id']).to_not eq(2)
      expect(content['updated_at']).to eq("2012-03-27T14:54:10.000Z")
    end
  end
end