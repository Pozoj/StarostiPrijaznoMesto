# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Srecko"
    last_name "Meh"
    sequence(:email) { |n| "srecko.meh#{n}@stari.si" }
    password "SimonTalek"
    password_confirmation "SimonTalek"
    user_kind_id "institution_admin"
    association :institution
    admin false
  end
end
