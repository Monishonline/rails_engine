# Rails Engine

Rails Engine is the development of a Rails versioned API which returns e-commerce data to a client in JSON format.
This includes endpoints for data stored as items, merchants, customers, transactions, invoice items, invoices, and transactions.

The project touches on the following points:

- Build Single-Responsibility controllers to provide a well-designed and versioned API
- Import large data sets from CSV files into a database using written Rake import tasks
- Test-Driven Development with additional endpoint validations by a provided a spec harness
- Use ActiveRecord queries to perform business intelligence

The original project spec can be found here: [Rails Engine Spec](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md)

## Setup

Clone, bundle, and launch the Rails server:

```
git clone git@github.com:roscalabrin/rails_engine.git
bundle

rake db:create db:migrate
```

### Import Data

```
rake import:merchants
rake import:customers
rake import:invoices
rake import:items
rake import:invoice_items
rake import:transactions
```

## Usage

Navigate to the following endpoints in a browser.

* 'x' is variable quantity
* ':id' for a merchant with values between (1-100)
* ':id' for a merchant with values between (1-2483)

```
localhost:3000/api/v1/merchants/:id/revenue
localhost:3000/api/v1/merchants/:id/revenue?date=x
localhost:3000/api/v1/merchants/most_items?quantity=x
localhost:3000/api/v1/customers/:id/favorite_merchant
localhost:3000/api/v1/items/:id/best_day
localhost:3000/api/v1/items/most_items?quantity=x
localhost:3000/api/v1/merchants/:id/customers_with_pending_invoices
localhost:3000/api/v1/merchants/:id/favorite_customer
localhost:3000/api/v1/items/most_revenue?quantity=x
localhost:3000/api/v1/merchants/revenue?date=x
localhost:3000/api/v1/merchants/most_revenue?quantity=x
```

### Test suite

Run the following command to begin the test suite:
```
rspec
```
