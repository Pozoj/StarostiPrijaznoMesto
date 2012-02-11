# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    sequence(:name) { |n| "Velenje#{n}" }
    association :region
  end
end
