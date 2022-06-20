# Lockstep
A financial service SDK for rails for innovative accounting solutions providers.

### Who are we?
Lockstep automates accounting workflows to improve your operational efficiency and cash flow. Accelerate payments through automated customer communications, enhanced collections activity management, and innovative forecasting and reporting.

### lockstep_rails
lockstep_rails makes it easy to interact with lockstep.io's REST API. It adheres to the ActiveRecord pattern. LockstepRails is fully ActiveModel compliant, meaning you can use validations and Rails forms.

Ruby/Rails developers should feel right at home.

If you're used to `Lockstep::Contact.create(:email_address => "test@emaildomain.com")`, then this is for you.

### Features
*   ActiveRecord-like API, almost no learning curve
*   Validations
*   Rails forms and scaffolds **just work**

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'lockstep_rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install lockstep_rails
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# Usage

### Available Records
* Lockstep::Contact
* Lockstep::Connection
* Lockstep::Account
* Lockstep::User
* Lockstep::Note
* Lockstep::Invoice
* Lockstep::InvoiceSummary
* Lockstep::CustomerSummary
* Lockstep::Payments
* Lockstep::PaymentSummary
* Lockstep::AppEnrollment
* Lockstep::ReportArAgingHeader
* Lockstep::ReportCashflow
* Lockstep::ReportDailySalesOutstanding
* Lockstep::ReportRiskRate
* Lockstep::ReportApAgingHeader
* Lockstep::ReportDailyPayableOutstanding
* Lockstep::ReportPayableComingDue
* Lockstep::ReportPayableSummary

## ActiveModel Interfaces

`lockstep_rails` supports the standard CRUD interface of ActiveRecord.

### Create
You can create a record by calling `new` or `create`

```ruby
Lockstep::Contact.create(email_address: "inbox@companyemail.com")
```

You can create records from associations as well. This will automatically association the relationship with the parent record
```ruby
connection = Lockstep::Connection.find(company_id: "17544da8-7be8-4ee2-8c62-cbd81428c68b")
connection.contacts.create(email_address: "inbox@companyemail.com")
```

### Update
Similar to ActiveRecord, you can update a record by calling `update`, `update_attributes` or `update_attribute`

Examples:
```ruby
connection = Lockstep::Connection.find(company_id: "17544da8-7be8-4ee2-8c62-cbd81428c68b")
connection.update(company_name: "New name")

# Or
connection.update_attributes(company_name: "New name")

# Or
connection.update_attribute(:company_name, "New name")
```

### Find
Similar to ActiveRecord, you can find a record by calling `find`, `find_by` or `find_by_company_id`

Examples:
```ruby
connection = Lockstep::Connection.find(company_id: "17544da8-7be8-4ee2-8c62-cbd81428c68b")
connection.update(company_name: "New name")

# Or
connection.update_attributes(company_name: "New name")

# Or
connection.update_attribute(:company_name, "New name")
```

### Where
Similar to ActiveRecord, you can search for records by calling `where`. 

Unless you are accessing the record via `first`, you will have to call `execute` to fetch the records

Examples:
```ruby
Lockstep::Connection.where(status: "Active").execute
```

#### Chaining
You can chain queries while calling where.

```ruby
Lockstep::Connection.where(status: "Active").where(default_currency_code: "USD").execute
```

#### OR Query
You can build an or query by calling `or`

```ruby
Lockstep::Connection.where(status: "Active").or(Lockstep::Connection.where(default_currency_code: "USD")).execute
```

#### Advanced Queries
[Searchlight](https://developer.lockstep.io/docs/querying-with-searchlight) supports building complex comparisons in the query.

| Suffice      | Searchlight Query     | Example                                           |
|--------------|-----------------------|---------------------------------------------------|
| _eq          | Equals                | where(name_eq: "Test Name")                       |
| _gt          | Greater Than          | where(amount_gt: 100)                             |
| _ge          | Greater Than Or Equal | where(amount_ge: 100)                             |
| _lt          | Less Than             | where(amount_lt: 100)                             |
| _le          | Less Than Or Equal    | where(amount_le: 100)                             |
| _ne          | Not Equal             | where(name_ne: "tak")                             |
| _in          | IN                    | where(name_in: ["tik", "tok"])                    |
| _contains    | CONTAINS              | where(name_contains: "kit")                       |
| _starts_with | STARTSWITH            | where(name_starts_with: "tik")                    |
| _ends_with   | ENDSWITH              | where(name_ends_with: "tok")                      |
| _is          | IS                    | where(name_is: nil) where(name_is: "NOT NULL")    |

#### Searchlight Queries
Using the rails standard queries generates searchlight compatible queries. 
if you wish, you can always write raw [Searchlight](https://developer.lockstep.io/docs/querying-with-searchlight) queries by passing a string in the where block

```ruby
Lockstep::Connection.where("isActive is true OR default_currency_code in ('USD', 'INR')").execute
```

### Count
You can fetch the count of available records by calling `count`

```ruby
Lockstep::Connection.count
# 1000

Lockstep::Connection.where(status: "Active").count
# 100
```

### Limit
You can limit the number of records being fetched by passing `limit`

The default limit is 200.

```ruby
Lockstep::Connection.limit(100).execute

Lockstep::Connection.where(status: "Active").limit(100).execute
```

### Pagination
You can paginate the records by passing the `page`

```ruby
Lockstep::Connection.page(2).execute

Lockstep::Connection.where(status: "Active").limit(100).page(2).execute
```

## Adding relationships with ActiveRecord
If you would like to link the `Lockstep::ApiRecord` with an `ActiveRecord::Base`, you can do so by including `Lockstep::ActiveRecords::Association`

This gives you access to 2 methods for defining relationships
* lockstep_has_many
* lockstep_belongs_to

```ruby
class User < ActiveRecord::Base
  include Lockstep::ActiveRecords::Association

  lockstep_has_many :connections, class_name: "Lockstep::Connection", primary_key: 'company_id', foreign_key: "lockstep_company_id"
  lockstep_belongs_to :account, class_name: "Lockstep::Account", primary_key: 'company_id', foreign_key: "lockstep_company_id"
  
end
```

#### Loader
You could define your own loader for fetching the records by passing a `loader` Proc

```ruby
class User < ActiveRecord::Base
  include Lockstep::ActiveRecords::Association

  lockstep_has_many :connections, class_name: "Lockstep::Connection", loader: -> (record) { Lockstep::Connection.where(is_active: true).where(company_id: record.lockstep_company_id) }
  lockstep_belongs_to :account, class_name: "Lockstep::Account", loader: -> (record) { Lockstep::Account.where(is_active: true).first }
  
end
```

# Updating API Schema

To update the schema to the latest one on https://api.dev.lockstep.io/swagger/v1/swagger.json, run

```bash
bundle exec rake update_api_schema
```
