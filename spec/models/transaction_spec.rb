require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should belong_to (:invoice) }
  
  it "calculates returns all the successful transactions" do
    create(:transaction, result: "success")
    create(:transaction, result: "success")
    create(:transaction, result: "failed")

    expect(Transaction.successful.count).to eq(2)
  end
  
  it "calculates returns all the pending transactions" do
    create(:transaction, result: "success")
    create(:transaction, result: "success")
    create(:transaction, result: "failed")

    expect(Transaction.pending.count).to eq(1)
  end
end