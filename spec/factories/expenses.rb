# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
    amount "9.99"
    day_of_month 1
    recurring false
  end
end
