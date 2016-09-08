require 'rails_helper'

RSpec.describe Api::V1::Invoices::CustomersController, :type => :request do

  describe "GET #show" do
    it "returns all invoices provided a merchant id" do
      customer = create(:customer, id: 2, first_name: "Joey")
      invoice = create(:invoice, id: 8, customer_id: customer.id)

      get '/api/v1/invoices/8/customer'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content['first_name']).to eq("Joey")
      expect(content['id']).to eq(2)
    end
  end
end