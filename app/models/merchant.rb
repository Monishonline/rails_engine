class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def revenue
    invoices.
      joins(:transactions).
      where(transactions: {result: "success"}).
      includes(:invoice_items).
      sum("quantity * unit_price").to_f
  end

  def revenue_by_date(date)
    invoices.
      where(created_at: date).
      joins(:transactions).
      where(transactions: {result: "success"}).
      includes(:invoice_items).
      sum("quantity * unit_price").to_f
  end

  def self.most_items(num_of_merchants)
    select("merchants.*, SUM(invoice_items.quantity) AS most_items").
      joins(invoices: [:transactions, :invoice_items]).
      where(transactions: {result: "success"}).
      group("merchants.id").
      order("most_items DESC").
      limit(num_of_merchants)
  end

  def customers_with_pending_invoices
    invoices.
      joins(:transactions).
      where(transactions: {result: "failed"}).
      distinct.map &:customer
  end

end
