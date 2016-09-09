class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.text :credit_card_number
      t.text :result
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
