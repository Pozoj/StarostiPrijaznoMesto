# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :institutionalized_answer, :class => "Answer" do
    association :post
    association :institution
  end

  factory :answered_answer, :class => "Answer" do
    association :user
    association :institution
    association :post
    answer "To je to"
    summary "To."
    answer_status "answered"
    answer_range "local"
  end
  
  factory :misplaced_answer, :class => "Answer" do
    association :user
    association :institution
    association :post
    answer_status "misplaced"
  end
  
  factory :waiting_answer, :class => "Answer" do
    association :user
    association :institution
    association :post
    answer "To je to"
    summary "To."
    answer_status "waiting"
    answer_range "local"
  end
  
  
end
