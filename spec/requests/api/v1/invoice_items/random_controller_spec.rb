require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random invoice_item" do
      customers = create_list(:invoice_item, 3)

      get '/api/v1/invoice_items/random'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.keys).to eq(["id", "item_id", "invoice_id", "quantity", "unit_price", "created_at", "updated_at"])
    end
  end
end
