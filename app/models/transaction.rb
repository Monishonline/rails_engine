class Transaction < ActiveRecord::Base
  #default_scope { where(result: "success") }
  belongs_to :invoice
end
