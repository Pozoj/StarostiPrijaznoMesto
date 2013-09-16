class git add .HomescreenPost < ActiveRecord::Base
  set_table_name "homescreen_posts_v"
  # CREATE VIEW homescreen_posts_v AS
  #   SELECT  
  #     DATE(original_posts.created_at) AS original_posts_created_at, 
  #     CONCAT(original_posts.first_name, ' ', original_posts.last_name) AS senders_name,
  #     posts.id AS posts_id,
  #     posts.title AS posts_title,
  #     posts.sex_id AS senders_sex,
  #     posts.post_kind_id AS post_kind_id,
  #     institutions.id AS institutions_id,
  #     institutions.name AS institutions_name,
  #     answers.summary AS answers_summary,
  #     DATE(answers.answered_at) AS answers_date
  #   FROM original_posts
  #     LEFT JOIN posts ON original_posts.id = posts.original_post_id
  #     LEFT JOIN answers ON posts.id = answers.post_id
  #     LEFT JOIN institutions ON answers.institution_id = institutions.id
  #   WHERE posts.post_status_id = 'approved'
  #   AND answers.answer_status = 'answered';
end