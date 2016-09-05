class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.text :first_name
      t.text :last_name
      t.string :created_at
      t.string :updated_at
    end
  end
end
