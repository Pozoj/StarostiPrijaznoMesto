class PublicPost < ActiveRecord::Base
  set_table_name "public_posts_v"
  scope :comments,    where(:post_kind_id => "comment")
  scope :questions,   where(:post_kind_id => "question")
  scope :suggestions, where(:post_kind_id => "suggestion")
end