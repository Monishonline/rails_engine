require 'rails_helper'

RSpec.describe Api::V1::Customers::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random customer" do
      customers = FactoryGirl.create_list(:customer, 4)

      get '/api/v1/customers/random'
      expect(response).to be_success
    end
  end
end
