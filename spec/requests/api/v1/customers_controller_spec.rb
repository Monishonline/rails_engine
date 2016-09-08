require 'rails_helper'

RSpec.describe Api::V1::CustomersController, :type => :request do

  describe "GET #index" do
    it "returns all customers in index" do
      customer = FactoryGirl.create_list(:customer, 3)

      get '/api/v1/customers'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(3)
      expect(content.first['first_name']).to eq(customer.first.first_name)
      expect(content.first['last_name']).to eq(customer.first.last_name)
    end
  end

  describe "GET #show" do
    it "returns a customer by id" do
      customer = FactoryGirl.create(:customer, id: 14)

      get '/api/v1/customers/14'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to eq(14)
      expect(content['first_name']).to eq(customer.first_name)
      expect(content['last_name']).to eq(customer.last_name)
    end
  end
end
