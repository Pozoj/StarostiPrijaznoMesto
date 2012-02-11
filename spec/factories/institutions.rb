# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :institution do
    name "Zavod za zaposlovanje"
    short_name "ZZZS"
    description "Zrihtajo al job al soco."
    address "U centru 5"
    association :post_office
  end
end
