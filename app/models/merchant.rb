class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  
  def revenue
    invoices.joins(:transactions).where(:transactions => {result: "success"}).includes(:invoice_items).sum("quantity * unit_price").to_f
  end
end
