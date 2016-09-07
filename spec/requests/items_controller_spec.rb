require 'rails_helper'

RSpec.describe "items controller", :type => :request do
  describe "GET index" do
    it "returns a successful 200 response" do
      get '/api/v1/items'

      expect(response).to be_success
    end

    it "returns all items in index" do
      item = FactoryGirl.create(:item)

      get '/api/v1/items'

      items = JSON.parse(response.body)
      expect(items.count).to eq(1)
    end
  end
end
