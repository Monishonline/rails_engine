class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def successful_transactions
    invoices.
      joins(:transactions).
      merge(Transaction.successful)
  end

  def revenue
    successful_transactions.
      includes(:invoice_items).
      sum("quantity * unit_price").to_f
  end

  def revenue_by_date(date)
    invoices.
      where(created_at: date).
      joins(:transactions).
      merge(Transaction.successful).
      includes(:invoice_items).
      sum("quantity * unit_price").to_f
  end

  def self.total_revenue_by_date(date)
    joins(invoices: [:transactions, :invoice_items]).
      where(invoices: {created_at: date}).
      merge(Transaction.successful).
      sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def self.most_items(num_of_merchants)
    select("merchants.*, SUM(invoice_items.quantity) AS most_items").
      joins(invoices: [:transactions, :invoice_items]).
      merge(Transaction.successful).
      group("id").
      order("most_items DESC").
      limit(num_of_merchants)
  end

  def customers_with_pending_invoices
    customers.
      joins(:invoices).
      joins("INNER JOIN transactions ON transactions.invoice_id=invoices.id").
      merge(Transaction.pending).
      distinct
  end

  def favorite_customer
    customer = customers.joins(:transactions).
                merge(Transaction.successful).
                group("id").
                order("count_transactions DESC").
                limit(1).
                count("transactions").
                keys.join
    Customer.find(customer)
  end

  def self.most_revenue(quantity)
    select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_revenue").
      joins(invoices: [:transactions, :invoice_items]).
      merge(Transaction.successful).
      group("id").
      order("total_revenue DESC").
      take(quantity)
  end
end
