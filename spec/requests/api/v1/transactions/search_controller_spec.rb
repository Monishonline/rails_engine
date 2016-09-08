require 'rails_helper'

RSpec.describe Api::V1::Transactions::SearchController, :type => :request do

  describe "GET #index" do
    it "finds all transactions" do
      transactions = FactoryGirl.create_list(:transaction, 4)

      get '/api/v1/transactions/find_all'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(4)
      expect(content.first['id']).to eq(transactions.first.id)
      expect(content.first['invoice_id']).to eq(transactions.first.invoice_id)
      expect(content.first['result']).to eq(transactions.first.result)
    end
  end

  describe "GET #show" do
    it "returns a transaction by id" do
      transaction = FactoryGirl.create(:transaction, id: 8)

      get '/api/v1/transactions/find?id=8'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to_not eq(3)
      expect(content['id']).to eq(8)
    end

    it "returns a transaction by credit_card_number" do
      t = FactoryGirl.create(:transaction, credit_card_number: 1234567890123456)

      get '/api/v1/transactions/find?credit_card_number=1234567890123456'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['credit_card_number']).to_not eq(3)
      expect(content['credit_card_number']).to eq("1234567890123456")
    end

    it "returns a transaction by invoice_id" do
      invoice = FactoryGirl.create(:invoice, id: 7)
      transaction = FactoryGirl.create(:transaction, invoice_id: 7)

      get '/api/v1/transactions/find?invoice_id=7'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['invoice_id']).to eq(7)
    end

    it "returns all transactions by result" do
      transactions = FactoryGirl.create_list(:transaction, 3)

      get '/api/v1/transactions/find?result=success'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(6)
    end

    it "returns a transaction by created_at" do
      t = FactoryGirl.create(:transaction, created_at:"2012-03-27T14:54:10.000Z")

      get '/api/v1/transactions/find?created_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['created_at']).to eq("2012-03-27T14:54:10.000Z")
    end

    it "returns a transaction by updated_at" do
      t = FactoryGirl.create(:transaction, updated_at:"2012-03-27T14:54:10.000Z")

      get '/api/v1/transactions/find?updated_at=2012-03-27T14:54:10.000Z'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['updated_at']).to eq("2012-03-27T14:54:10.000Z")
    end
  end
end
