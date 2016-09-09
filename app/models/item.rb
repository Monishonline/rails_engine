class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items
  before_save :cents_to_dollars

  def cents_to_dollars
    self.unit_price = (unit_price.to_f / 100).to_s
  end
  
  def self.successful_transactions
    joins(invoices: :transactions).
    merge(Transaction.successful_transactions)
  end

  def best_day
    invoice_items.
      joins(invoice: :transactions).
      merge(Transaction.successful_transactions).
      group("invoices.created_at").
      order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").
      limit(1).
      sum("invoice_items.quantity * invoice_items.unit_price").
      keys.first
  end

  def self.most_items(num_of_items)
    select("items.*, SUM(invoice_items.quantity) AS most_items").
      successful_transactions.
      group("items.id").
      order("most_items DESC").
      limit(num_of_items)
  end

  def self.most_revenue(quantity)
    select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue").
      successful_transactions.
      group("items.id").
      order("total_revenue DESC").
      take(quantity)
  end
end
