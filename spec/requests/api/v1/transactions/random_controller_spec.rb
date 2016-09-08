require 'rails_helper'

RSpec.describe Api::V1::Transactions::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random transaction" do
      transactions = create_list(:transaction, 4)

      get '/api/v1/transactions/random'
      expect(response).to be_success

      content = JSON.parse(response.body)
    end
  end
end
