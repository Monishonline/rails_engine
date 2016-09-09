require 'rails_helper'

RSpec.describe Api::V1::Merchants::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random merchant" do
      merchants = create_list(:merchant, 4)

      get '/api/v1/merchants/random'
      expect(response).to be_success
    end
  end
end
