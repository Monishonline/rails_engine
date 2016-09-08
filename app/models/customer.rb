class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  
  def favorite_merchant
    # select(“merchants.*, 
    #         sum(invoice_items.quantity*invoice_items.unit_price) as   
    #         total_revenue”)
    #   .joins(invoices: [:transactions, :invoice_items])
    #   .where(transactions: {result: “success”})
    #   .group(“merchants.id”)
    #   .order(“total_revenue DESC”)
    #   .limit(1)
  end
    # transactions.where(result: "success").includes(invoice: :invoice_items).sum("quantity")
    # 
    # invoices.joins(:transactions).where(:transactions => {result: "success"}).includes(:invoice_items).sum("quantity").to_f

end
