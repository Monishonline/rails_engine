require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, :type => :request do

  describe "GET #index" do
    it "returns all transactions in index" do
      t = create_list(:transaction, 3)

      get '/api/v1/transactions'
      expect(response).to be_success

      json = JSON.parse(response.body)
      expect(json.count).to eq(3)
      expect(json.first['credit_card_number']).to eq(t.first.credit_card_number)
      expect(json.first['result']).to eq(t.first.result)
    end
  end

  describe "GET #show" do
    it "returns a transaction by id" do
      transaction = create(:transaction, id: 14)

      get '/api/v1/transactions/14'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content['id']).to eq(14)
      expect(content['invoice_id']).to eq(transaction.invoice_id)
      expect(content['result']).to eq(transaction.result)
    end
  end
end
