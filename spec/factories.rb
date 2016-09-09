require 'faker'

FactoryGirl.define do

  factory :merchant do
    name       Faker::Company.name
    created_at Faker::Time.between(3.days.ago, Date.today, :all)
    updated_at Faker::Time.between(2.days.ago, Date.today, :all)
  end

  factory :item do
    name        Faker::Commerce.product_name
    description Faker::Hipster.sentences(1)
    unit_price  Faker::Commerce.price
    merchant
    created_at  Faker::Time.between(3.days.ago, Date.today, :all)
    updated_at  Faker::Time.between(2.days.ago, Date.today, :all)
  end

  factory :customer do
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    created_at Faker::Time.between(3.days.ago, Date.today, :all)
    updated_at Faker::Time.between(2.days.ago, Date.today, :all)
  end

  factory :invoice do
    customer
    merchant
    status "shipped"
    created_at Faker::Time.between(3.days.ago, Date.today, :all)
    updated_at Faker::Time.between(2.days.ago, Date.today, :all)
  end

  factory :invoice_item do
    item
    invoice
    quantity   Faker::Number.between(1, 10)
    unit_price 201.89
    created_at Faker::Time.between(3.days.ago, Date.today, :all)
    updated_at Faker::Time.between(2.days.ago, Date.today, :all)
  end

  factory :transaction do
    invoice
    credit_card_number Faker::Number.number(16)
    result "success"
    created_at Faker::Time.between(3.days.ago, Date.today, :all)
    updated_at Faker::Time.between(2.days.ago, Date.today, :all)
  end
end
