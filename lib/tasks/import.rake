require 'csv'

namespace :import do
  desc "Import customers csv file"
  task :customers => [:environment] do

    file = "db/customers.csv"

    CSV.foreach(file, :headers => true) do |row|
      Customer.create!(
        first_name: row[1],
        last_name: row[2],
        created_at: row[3],
        updated_at: row[4]
      )
    end
  end

  desc "Import merchants csv file"
  task :merchants => [:environment] do

    file = "db/merchants.csv"

    CSV.foreach(file, :headers => true) do |row|
      Merchant.create!(
        name:       row[1],
        created_at: row[2],
        updated_at: row[3]
      )
    end
  end

  desc "Import invoices csv file"
  task :invoices => [:environment] do

    file = "db/invoices.csv"

    CSV.foreach(file, :headers => true) do |row|
      Invoice.create!(
        status:      row[1],
        customer_id: row[2],
        merchant_id: row[3],
        created_at:  row[4],
        updated_at:  row[5]
      )
    end
  end

  desc "Import items csv file"
  task :items => [:environment] do

    file = "db/items.csv"

    CSV.foreach(file, :headers => true) do |row|
      Item.create!(
        name:        row[1],
        description: row[2],
        unit_price:  row[3],
        merchant_id: row[4],
        created_at:  row[5],
        updated_at:  row[6]
      )
    end
  end

  desc "Import invoice_items csv file"
  task :invoice_items => [:environment] do

    file = "db/invoice_items.csv"

    CSV.foreach(file, :headers => true) do |row|
      InvoiceItem.create!(
        item_id:    row[1],
        invoice_id: row[2],
        quantity:   row[3],
        unit_price: row[4],
        created_at: row[5],
        updated_at: row[6]
      )
    end
  end

  desc "Import transactions csv file"
  task :transactions => [:environment] do

    file = "db/transactions.csv"

    CSV.foreach(file, :headers => true) do |row|
      Transaction.create!(
        invoice_id:                  row[1],
        credit_card_number:          row[2],
        # credit_card_expiration_date: row[3],
        result:                      row[4],
        created_at:                  row[5],
        updated_at:                  row[6]
      )
    end
  end
end
