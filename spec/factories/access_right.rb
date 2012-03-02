# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :access_right do
    user_kind_right "manageEvent"
    user_kind_id "institution_admin"
  end
end
