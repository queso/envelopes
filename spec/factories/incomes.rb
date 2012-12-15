# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :income do
    amount "9.99"
    day_of_month 1
    recurring false
    every_x_weeks 1
  end
end
