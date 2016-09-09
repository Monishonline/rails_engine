class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def revenue
    invoices.
      joins(:transactions).
      merge(Transaction.successful).
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

  def self.most_items(num_of_merchants)
    select("merchants.*, SUM(invoice_items.quantity) AS most_items").
      joins(invoices: [:transactions, :invoice_items]).
      merge(Transaction.successful).
      group("merchants.id").
      order("most_items DESC").
      limit(num_of_merchants)
  end

  def customers_with_pending_invoices
    customers.
      joins(:invoices).
      joins("INNER JOIN transactions on transactions.invoice_id=invoices.id").
      merge(Transaction.pending).
      distinct
  end
 
  def favorite_customer
    customer = customers.joins(:transactions).
                merge(Transaction.successful).
                group("customers.id").
                order("count_transactions desc").
                limit(1).
                count("transactions").
                keys.join
    Customer.find(customer)
  end
end
