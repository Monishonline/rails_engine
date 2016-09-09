class Transaction < ActiveRecord::Base
  belongs_to :invoice
  
  def self.successful_transactions
    where(result: "success")
  end
end
