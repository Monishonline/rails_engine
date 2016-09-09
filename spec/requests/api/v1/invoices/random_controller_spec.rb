require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random invoice" do
      invoices = create_list(:invoice, 3)

      get '/api/v1/invoices/random'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content).to have_key("id")
      expect(content).to have_key("status")
    end
  end
end
