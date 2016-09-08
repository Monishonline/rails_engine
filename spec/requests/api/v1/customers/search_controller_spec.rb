require 'rails_helper'

RSpec.describe Api::V1::Customers::SearchController, :type => :request do

  describe "GET #index" do
    it "finds all transactions" do
      customers = create_list(:customer, 4)

      get '/api/v1/customers/find_all'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(4)
      expect(content.first['first_name']).to eq(customers.first.first_name)
      expect(content.first['last_name']).to eq(customers.first.last_name)
    end
  end

  describe "GET #show" do
    it "returns a customer by id" do
      customer = create(:customer, id: 8)

      get '/api/v1/customers/find?id=8'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to_not eq(3)
      expect(content['id']).to eq(8)
    end

    it "returns a customer by first_name" do
      customer = create(:customer, first_name: "John")

      get '/api/v1/customers/find?first_name=John'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['first_name']).to eq("John")
    end

    it "returns a customer by last_name" do
      customer = create(:customer, last_name: "Johnson")

      get '/api/v1/customers/find?last_name=Johnson'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['last_name']).to eq("Johnson")
    end

    it "returns a customer by created_at" do
      customer = create(:customer, created_at:"2012-03-27T14:54:10.000Z")

      get '/api/v1/customers/find?created_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['created_at']).to eq("2012-03-27T14:54:10.000Z")
    end

    it "returns a customer by updated_at" do
      customer = create(:customer, updated_at:"2012-03-27T14:54:10.000Z")

      get '/api/v1/customers/find?updated_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['updated_at']).to eq("2012-03-27T14:54:10.000Z")
    end
  end
end
