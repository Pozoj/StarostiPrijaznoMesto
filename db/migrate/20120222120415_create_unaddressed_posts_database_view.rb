class CreateUnaddressedPostsDatabaseView < ActiveRecord::Migration
  def up
    execute("DROP VIEW IF EXISTS unaddressed_posts_v;")
    drop_table :unaddressed_posts_v if self.table_exists?("unaddressed_posts_v")
    execute(
      "CREATE VIEW unaddressed_posts_v AS
      SELECT  original_posts.id AS original_posts_id, 
        original_posts.created_at AS original_posts_created_at, 
        original_posts.first_name AS original_posts_first_name, 
        original_posts.last_name AS original_posts_last_name,
        posts.id AS posts_id,
        posts.created_at AS posts_created_at,
        posts.tag_group_id AS posts_tag_group_id,
        posts.title AS posts_title,
        posts.post_kind_id AS posts_post_kind_id,
        attachments.id AS attachments_id 
      FROM original_posts
        LEFT JOIN posts ON original_posts.id = posts.original_post_id
        LEFT JOIN attachments ON original_posts.id = attachments.holder_id
        LEFT JOIN answers ON answers.post_id = posts.id
      WHERE answers.id IS NULL
      AND posts.post_status_id = 'approved';")
  end

  def down
    execute("DROP VIEW unaddressed_posts_v;")
    drop_table :unaddressed_posts_v if self.table_exists?("unaddressed_posts_v")
  end
end
