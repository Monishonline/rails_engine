require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random invoice" do
      customers = create_list(:customer, 4)

      get '/api/v1/invoices/random'
      expect(response).to be_success
    end
  end
end