# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    association :original_post
    association :user
    post_kind_id "question"
    title "Ka je zaj"
    summary "Obce vprasanje nasih krajanov, ki vekomaj roma po nasih krajih"
    text "Kaj je zzaj sm opraso."
    post_status_id "approved"
    sex_id "man"
    tag_group_id "fifth"
  end
  
  factory :rejected_post, :class => "Post" do
    association :original_post
    association :user
    post_status_id "rejected"
  end
end
