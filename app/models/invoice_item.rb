class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item
  before_save :cents_to_dollars
  
  def cents_to_dollars
    self.unit_price = (unit_price.to_f / 100).to_s
  end
end
