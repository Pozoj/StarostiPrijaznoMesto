# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :region do
    sequence(:name) { |n| "Savinjska#{n}" }
  end
end
