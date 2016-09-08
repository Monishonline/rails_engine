require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, :type => :request do

  describe "GET #index" do
    it "returns all invoices provided a merchant id" do
      merchant = FactoryGirl.create(:merchant, id: 4)
      invoice = FactoryGirl.create(:invoice, id: 8, merchant_id: merchant.id)

      get '/api/v1/merchants/4/invoices'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(1)
    end
  end
end
