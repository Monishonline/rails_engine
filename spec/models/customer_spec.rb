require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many :invoices }
  it { should have_many :transactions }
  it { should have_many :merchants }
  
  it " returns a merchant where the customer has conducted the most successful transactions" do
    merchant  = create(:merchant, id: 1)
    merchant2 = create(:merchant, id: 2)
    customer  = create(:customer, id: 2)
    
    item  = create(:item, id: 3, merchant_id: merchant.id)
    item2 = create(:item, id: 4, merchant_id: merchant2.id)
    
    invoice  = create(:invoice, id: 1, merchant_id: merchant.id, customer_id: customer.id)
    invoice2 = create(:invoice, id: 2, merchant_id: merchant.id, customer_id: customer.id)
    invoice3 = create(:invoice, id: 3, merchant_id: merchant2.id, customer_id: customer.id)
    
    create(:transaction, invoice_id: invoice.id, result: "success")
    create(:transaction, invoice_id: invoice2.id, result: "success")
    create(:transaction, invoice_id: invoice3.id, result: "success")

    expect(customer.favorite_merchant).to eq(merchant)
  end
end