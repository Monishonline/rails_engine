require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, :type => :request do

  describe "GET #index" do
    it "returns all the invoices associated with a specific customer" do
      customer  = create(:customer, id: 1)
      customer2 = create(:customer, id: 2)
      create(:invoice, id: 1, customer_id: customer.id)
      create(:invoice, id: 2, customer_id: customer.id)
      create(:invoice, id: 3, customer_id: customer2.id)

      get '/api/v1/customers/1/invoices'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.count).to eq(2)
      expect(content.first['id']).to eq(1)
      expect(content.second['id']).to eq(2)
    end
  end
end
