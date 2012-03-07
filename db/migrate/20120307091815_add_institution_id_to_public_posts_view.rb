class AddInstitutionIdToPublicPostsView < ActiveRecord::Migration
  def up
    execute("DROP VIEW IF EXISTS public_posts_v;")
    drop_table :public_posts_v if self.table_exists?("public_posts_v")
    execute(
    "CREATE VIEW public_posts_v AS
    SELECT  
      DATE(original_posts.created_at) AS original_posts_created_at, 
      CONCAT(original_posts.first_name, ' ', original_posts.last_name) AS senders_name,
      posts.id AS posts_id,
      posts.title AS posts_title,
      posts.post_kind_id AS post_kind_id,
      posts.tag_group_id AS posts_tag_group_id,
      institutions.name AS institutions_name,
      institutions.id AS institutions_id,
      answers.answer_status AS answers_answer_status,
      DATE(answers.answered_at) AS answers_date
    FROM original_posts
      LEFT JOIN posts ON original_posts.id = posts.original_post_id
      LEFT JOIN answers ON posts.id = answers.post_id
      LEFT JOIN institutions ON answers.institution_id = institutions.id
    WHERE 
      (posts.post_status_id = 'approved' AND answers.answer_status != 'misplaced')
    OR
      (posts.post_status_id = 'approved' AND answers.id IS NULL);")
  end

  def down
    execute("DROP VIEW IF EXISTS public_posts_v;")
    drop_table :public_posts_v if self.table_exists?("public_posts_v")
  end
end
