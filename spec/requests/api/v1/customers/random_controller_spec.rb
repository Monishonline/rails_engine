require 'rails_helper'

RSpec.describe Api::V1::Customers::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a response for a random customer" do
      customers = create_list(:customer, 3)

      get '/api/v1/customers/random'
      expect(response).to be_success
    end
  end
end
