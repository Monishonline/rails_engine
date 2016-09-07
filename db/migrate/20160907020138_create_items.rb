class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at
      t.references :merchant, foreign_key: true
    end
  end
end