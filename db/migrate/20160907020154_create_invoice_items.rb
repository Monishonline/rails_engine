class CreateInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at
      t.references :invoice, foreign_key: true
      t.references :item, foreign_key: true
    end
  end
end
