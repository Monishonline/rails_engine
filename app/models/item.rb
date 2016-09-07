class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items


  def self.find_by_params(params)
    where("LOWER(params.values) LIKE ?", "%#{params.values.downcase}%").take
    where("LOWER(params.values) ILIKE ?", "%#{params.values}%").take
  end
end
