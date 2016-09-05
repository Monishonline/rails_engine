class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.text :status
      t.string :created_at
      t.string :updated_at
      t.references :customer, foreign_key: true
      t.references :merchant, foreign_key: true
    end
  end
end
