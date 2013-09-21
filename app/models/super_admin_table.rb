class SuperAdminTable < ActiveRecord::Base
  self.table_name = 'super_admin_table_v'
  scope :approved, where(:posts_post_status_id => "approved" )
  # Querry for super_admin_table_v 
  # ---
  # CREATE VIEW super_admin_table_v AS
  #  SELECT  original_posts.id AS original_posts_id, 
  #          original_posts.created_at AS original_posts_created_at, 
  #          original_posts.first_name AS original_posts_first_name, 
  #          original_posts.last_name AS original_posts_last_name, 
  #          posts.id AS posts_id,
  #          posts.created_at AS posts_created_at,
  #          posts.post_status_id AS posts_post_status_id, 
  #          posts.post_kind_id AS posts_post_kind_id, 
  #          posts.title AS posts_title, 
  #          posts.tag_group_id AS posts_tag_group_id, 
  #          institutions.id AS institutions_id, 
  #          institutions.name AS institutions_name, 
  #          responders.id AS responders_id, 
  #          responders.first_name AS responders_first_name, 
  #          responders.last_name AS responders_last_name,
  #          info_admins.id AS info_admins_id,
  #          info_admins.first_name AS info_admins_first_name,
  #          info_admins.last_name AS info_admins_last_name,
  #          answers.id AS answers_id, 
  #          answers.answer_status AS answers_answer_status, 
  #          answers.institutionalized_at AS answers_institutionalized_at, 
  #          answers.misplaced_at AS answers_misplaced_at, 
  #          answers.answered_at AS answers_answered_at,
  #          attachments.id AS attachments_id
  #  FROM original_posts
  #    LEFT JOIN posts   ON original_posts.id = posts.original_post_id
  #    LEFT JOIN answers ON posts.id = answers.post_id
  #    LEFT JOIN institutions ON answers.institution_id = institutions.id
  #    LEFT JOIN users AS responders ON answers.user_id = responders.id
  #    LEFT JOIN users AS info_admins ON posts.info_admin_id = info_admins.id
  #    LEFT JOIN attachments ON original_posts.id = attachments.holder_id;
end