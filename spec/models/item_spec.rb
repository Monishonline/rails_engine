require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_many :invoice_items }
  it { should have_many :invoices }
  it { should belong_to (:merchant) }
  
  it "calculates the best of sale for an item" do
    merchant = create(:merchant, id: 1)
    customer = create(:customer, id: 2)
    item     = create(:item, id: 3, merchant_id: 1)
    invoice  = create(:invoice, id: 4, merchant_id: merchant.id, customer_id: customer.id, created_at: "2016-03-20T23:57:05.000Z")
    invoice2 = create(:invoice, id: 5, merchant_id: merchant.id, customer_id: customer.id, created_at: "2010-03-20T23:57:05.000Z")
    
    create(:invoice_item, invoice_id: invoice.id, item_id: item.id, quantity: 10)
    create(:transaction, invoice_id: 4, result: "success")
    
    create(:invoice_item, invoice_id: invoice2.id, item_id: item.id, quantity: 2)
    create(:transaction, invoice_id: 4, result: "success")

    expect(item.best_day).to eq("2016-03-20 23:57:05 UTC")
  end
end