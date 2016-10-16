class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchant = merchants.joins(:transactions).
                where(transactions: {result: "success"}).
                group("id").
                order("count(transactions) desc").
                first
    Merchant.find(merchant)
  end
end
