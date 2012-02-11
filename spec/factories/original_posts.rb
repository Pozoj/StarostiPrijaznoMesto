# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :original_post do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    ip "MyString"
    text "MyText"
  end
end
