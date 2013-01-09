class PublicPost < ActiveRecord::Base
  self.table_name = "public_posts_v"
  scope :comments,    where(:post_kind_id => "comment")
  scope :questions,   where(:post_kind_id => "question")
  scope :suggestions, where(:post_kind_id => "suggestion")
  scope :for_institution, lambda { |institution_id| where(:institutions_id => institution_id) }
  
  # Querry for public_posts_v 
  # ---
  # CREATE VIEW public_posts_v AS
  # SELECT  
  #   DATE(original_posts.created_at) AS original_posts_created_at, 
  #   CONCAT(original_posts.first_name, ' ', original_posts.last_name) AS senders_name,
  #   posts.id AS posts_id,
  #   posts.title AS posts_title,
  #   posts.post_kind_id AS post_kind_id,
  #   posts.tag_group_id AS posts_tag_group_id,
  #   institutions.name AS institutions_name,
  #   institutions.id AS institutions_id,
  #   answers.answer_status AS answers_answer_status,
  #   DATE(answers.answered_at) AS answers_date
  # FROM original_posts
  #   LEFT JOIN posts ON original_posts.id = posts.original_post_id
  #   LEFT JOIN answers ON posts.id = answers.post_id
  #   LEFT JOIN institutions ON answers.institution_id = institutions.id
  # WHERE 
  #   (posts.post_status_id = 'approved' AND answers.answer_status != 'misplaced')
  # OR
  #   (posts.post_status_id = 'approved' AND answers.id IS NULL);
end