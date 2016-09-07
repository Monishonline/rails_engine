class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.text :status
      t.datetime :created_at
      t.datetime :updated_at
      t.references :customer, foreign_key: true
      t.references :merchant, foreign_key: true
    end
  end
end
