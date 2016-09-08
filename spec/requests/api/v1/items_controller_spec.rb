require 'rails_helper'

RSpec.describe Api::V1::ItemsController, :type => :request do

  describe "GET #index" do
    it "returns all items in index" do
      item = create_list(:item, 3)

      get '/api/v1/items'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(3)
    end
  end

  describe "GET #show" do
    it "returns an item by id" do
      item = create(:item, id: 7)

      get '/api/v1/items/7'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to eq(7)
      expect(content['name']).to eq(item.name)
      expect(content['description']).to eq(item.description)
    end
  end
end
