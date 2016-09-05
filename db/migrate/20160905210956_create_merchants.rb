class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |t|
      t.text :name
      t.string :created_at
      t.string :updated_at
    end
  end
end
