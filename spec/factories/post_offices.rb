# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_office do
    sequence(:post_number) { |n| n.to_i }
    sequence(:city) { |n| "Velenje#{n}" }
  end
end
