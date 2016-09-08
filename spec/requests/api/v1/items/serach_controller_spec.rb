require 'rails_helper'

RSpec.describe Api::V1::Items::SearchController, :type => :request do
  # 
  # describe "GET #index" do
  #   it "finds all invoice_items by quantity" do
  #     create(:invoice_item, id: 1, quantity: 2)
  #     create(:invoice_item, id: 2, quantity: 2)
  #     create(:invoice_item, id: 3, quantity: 4)
  # 
  #     get '/api/v1/invoice_items/find_all?quantity=2'
  #     expect(response).to be_success
  # 
  #     content = JSON.parse(response.body)
  #     expect(content.count).to eq(2)
  #   end
  #   
  #   it "finds all invoice_items by unit_price" do
  #     create(:invoice_item, id: 1, unit_price: 18987)
  #     create(:invoice_item, id: 2, unit_price: 18987)
  #     create(:invoice_item, id: 3, unit_price: 80000)
  #   
  #     get '/api/v1/invoice_items/find_all?unit_price=189.87'
  #     expect(response).to be_success
  #   
  #     content = JSON.parse(response.body)
  #     expect(content.count).to eq(2)
  #   end
  # end
  # 
  # describe "GET #show" do
  #   it "returns an invoice_item by id" do
  #     create(:invoice_item, id: 8)
  # 
  #     get '/api/v1/invoice_items/find?id=8'
  #     expect(response).to be_success
  # 
  #     content = JSON.parse(response.body)
  #     expect(content['id']).to_not eq(3)
  #     expect(content['id']).to eq(8)
  #   end
  # 
  #   it "returns an invoice_item by item_id" do
  #     item = create(:item, id: 2)
  #     create(:invoice_item, id: 4, item_id: item.id)
  # 
  #     get '/api/v1/invoice_items/find?item_id=2'
  #     expect(response).to be_success
  # 
  #     content = JSON.parse(response.body)
  # 
  #     expect(content['id']).to eq(4)
  #   end
  #   
  #   it "returns an invoice_item by invoice_id" do
  #     invoice = create(:invoice, id: 2)
  #     create(:invoice_item, id: 4, invoice_id: invoice.id)
  # 
  #     get '/api/v1/invoice_items/find?invoice_id=2'
  #     expect(response).to be_success
  # 
  #     content = JSON.parse(response.body)
  # 
  #     expect(content['id']).to eq(4)
  #   end
  #   
  #   it "returns an invoice_item by quantity" do
  #     create(:invoice_item, id: 1, quantity: 10)
  #     create(:invoice_item, id: 2, quantity: 5)
  # 
  #     get '/api/v1/invoice_items/find?quantity=10'
  #     expect(response).to be_success
  # 
  #     content = JSON.parse(response.body)
  # 
  #     expect(content['id']).to eq(1)
  #     expect(content['id']).to_not eq(2)
  #   end
  #   
  #   it "returns an invoice_item by unit_price" do
  #     create(:invoice_item, id: 1, unit_price: 10090)
  #     create(:invoice_item, id: 2, unit_price: 90008)
  # 
  #     get '/api/v1/invoice_items/find?unit_price=100.90'
  #     expect(response).to be_success
  # 
  #     content = JSON.parse(response.body)
  # 
  #     expect(content['id']).to eq(1)
  #     expect(content['id']).to_not eq(2)
  #   end
  # 
  # 
  #   it "returns an invoice_item by created_at" do
  #     create(:invoice_item, id: 1, created_at:"2012-03-27T14:54:10.000Z")
  #     create(:invoice_item, id: 2, created_at:"2014-03-27T14:54:10.000Z")
  #   
  #     get '/api/v1/invoice_items/find?created_at=2012-03-27T14:54:10.000Z'
  #     expect(response).to be_success
  #   
  #     content = JSON.parse(response.body)
  #     expect(content['id']).to eq(1)
  #     expect(content['id']).to_not eq(2)
  #     expect(content['created_at']).to eq("2012-03-27T14:54:10.000Z")
  #   end
  #   
  #   it "returns an invoice_item by updated_at" do
  #     create(:invoice_item, id: 1, updated_at:"2012-03-27T14:54:10.000Z")
  #     create(:invoice_item, id: 2, updated_at:"2012-03-27T14:54:10.000Z")
  #   
  #     get '/api/v1/invoice_items/find?updated_at=2012-03-27T14:54:10.000Z'
  #     expect(response).to be_success
  #   
  #     content = JSON.parse(response.body)
  #     expect(content['id']).to eq(1)
  #     expect(content['id']).to_not eq(2)
  #     expect(content['updated_at']).to eq("2012-03-27T14:54:10.000Z")
  #   end
  # end
end