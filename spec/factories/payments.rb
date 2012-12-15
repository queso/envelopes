# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    expense nil
    pay_date "2012-12-10"
    amount "9.99"
  end
end
