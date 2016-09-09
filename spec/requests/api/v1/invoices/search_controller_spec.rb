require 'rails_helper'

RSpec.describe Api::V1::Invoices::SearchController, :type => :request do

  describe "GET #index" do
    it "finds all invoices by status" do
      create(:invoice, id: 1, status: "success")
      create(:invoice, id: 2, status: "success")
      create(:invoice, id: 3, status: "failed")

      get '/api/v1/invoices/find_all?status=success'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(2)
    end
  end

  describe "GET #show" do
    it "returns an invoice by id" do
      create(:invoice, id: 8)

      get '/api/v1/invoices/find?id=8'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to_not eq(3)
      expect(content['id']).to eq(8)
    end

    it "returns an invoice by customer_id" do
      create(:customer, id: 2, last_name: "Johnson")
      create(:invoice, id: 4, customer_id: 2, status: "success")

      get '/api/v1/invoices/find?customer_id=2'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['id']).to eq(4)
      expect(content['status']).to eq("success")
    end

    it "returns an invoice by merchant_id" do
      create(:merchant, id: 3, name: "Johnson")
      create(:invoice, id: 4, merchant_id: 3, status: "success")

      get '/api/v1/invoices/find?merchant_id=3'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['id']).to eq(4)
      expect(content['status']).to eq("success")
    end
    
    it "returns an invoice by status" do
      create(:invoice, id: 1, status: "success")
      create(:invoice, id: 2, status: "success")
      create(:invoice, id: 3, status: "failed")

      get '/api/v1/invoices/find?status=success'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['id']).to eq(1)
      expect(content['id']).to_not eq(2)
      expect(content['id']).to_not eq(3)
    end
 
    it "returns an invoice by created_at" do
      invoice = create(:invoice, created_at:"2012-03-27T14:54:10.000Z")
    
      get '/api/v1/invoices/find?created_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success
    
      content = JSON.parse(response.body)
      expect(content['created_at']).to eq("2012-03-27T14:54:10.000Z")
    end
    
    it "returns an invoice by updated_at" do
      customer = create(:customer, updated_at:"2012-03-27T14:54:10.000Z")
    
      get '/api/v1/customers/find?updated_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success
    
      content = JSON.parse(response.body)
      expect(content['updated_at']).to eq("2012-03-27T14:54:10.000Z")
    end
  end
end