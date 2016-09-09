require 'rails_helper'

RSpec.describe Api::V1::Items::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random item" do
      customers = create_list(:item, 4)

      get '/api/v1/invoices/random'
      expect(response).to be_success
    end
  end
end