require 'rails_helper'

RSpec.describe Api::V1::Merchants::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a random merchant" do
      merchants = create_list(:merchant, 3)

      get '/api/v1/merchants/random'
      expect(response).to be_success

      content = JSON.parse(response.body)

      expect(content).to have_key("id")
      expect(content).to have_key("name")
    end
  end
end
