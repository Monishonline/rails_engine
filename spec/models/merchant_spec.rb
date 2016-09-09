require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many :items }
  it { should have_many :invoices }
  it { should have_many :invoice_items }
  it { should have_many :transactions }
  it { should have_many :customers }
  
  it "calculates the revenue of a merchant" do
    merchant = create(:merchant, id: 5)
    
    invoice  = create(:invoice, id: 1, merchant_id: merchant.id)
    invoice2 = create(:invoice, id: 2, merchant_id: merchant.id)
    
    create(:invoice_item, invoice_id: invoice.id, unit_price: 9000, quantity: 1)
    create(:transaction, invoice_id: invoice.id, result: "success")
    
    create(:invoice_item, invoice_id: invoice2.id, unit_price: 5000, quantity: 2)
    create(:transaction, invoice_id: invoice2.id, result: "success")

    expect(merchant.revenue).to eq(190.00)
  end
  
  it "calculates the total revenue of a merchant in a specific date" do
    merchant  = create(:merchant, id: 1)
    
    invoice  = create(:invoice, id: 1, merchant_id: merchant.id, created_at: "2016-03-20 23:57:05 UTC")

    invoice2 = create(:invoice, id: 2, merchant_id: merchant.id, created_at:
    "2010-03-20T23:57:05.000Z")
    
    create(:invoice_item, invoice_id: invoice.id, unit_price: 9000, quantity: 1)
    create(:transaction, invoice_id: invoice.id, result: "success")
    
    create(:invoice_item, invoice_id: invoice2.id, unit_price: 5000, quantity: 2)
    create(:transaction, invoice_id: invoice2.id, result: "success")
    
    date = "2016-03-20 23:57:05 UTC"
    expect(merchant.revenue_by_date(date)).to eq(90.00)
  end
end