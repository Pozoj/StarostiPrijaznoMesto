# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "Kul piknik"
    description "Kul piknik bo"
    date_and_time_at "2012-01-24 12:00:00"
    association :institution
    association :user
    address "Presernova 12"
    association :post_office
  end
end
