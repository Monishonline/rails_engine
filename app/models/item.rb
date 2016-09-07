class Item < ActiveRecord::Base  
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items
  
  def unit_price
    (super.to_f / 100).to_s
  end
end
