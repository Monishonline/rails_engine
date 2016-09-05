class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.text :credit_card_number
      t.text :credit_card_expiration_date
      t.text :result
      t.string :created_at
      t.string :updated_at
      t.references :invoice, foreign_key: true
    end
  end
end
