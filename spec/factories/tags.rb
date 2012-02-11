# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    tag "Cene javnega prevoza so stalne, prikazane na vidnem mestu in zepu dosegljive."
    association :tag_group
  end
end
