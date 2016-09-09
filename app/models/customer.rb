class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices
  
  def favorite_merchant
    merchant = merchants.joins(:transactions).
                where(transactions: {result: "success"}).
                group("merchants.id").
                order("count_transactions desc").
                limit(1).
                count("transactions").
                keys.join
    Merchant.find(merchant)
  end
end
