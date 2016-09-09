require 'rails_helper'

RSpec.describe Api::V1::Transactions::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random transaction" do
      transactions = create_list(:transaction, 3)

      get '/api/v1/transactions/random'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.keys).to eq(["id", "invoice_id", "credit_card_number", "result", "created_at", "updated_at"])
    end
  end
end
