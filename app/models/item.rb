class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items
  before_save :cents_to_dollars

  def cents_to_dollars
    self.unit_price = (unit_price.to_f / 100).to_s
  end
end
