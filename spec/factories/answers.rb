# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    association :user
    association :institution
    association :post
    answer "To je to"
    summary "To."
    answer_status "answered"
  end
end
