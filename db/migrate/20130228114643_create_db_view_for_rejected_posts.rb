class CreateDbViewForRejectedPosts < ActiveRecord::Migration
  def up
    execute(
      "CREATE VIEW rejected_posts_v AS
      SELECT  
        DATE(original_posts.created_at) AS original_posts_created_at, 
        original_posts.first_name AS original_posts_first_name, 
        original_posts.last_name AS original_posts_last_name,
        original_posts.email AS original_posts_email,
        attachments.id AS attachments_id,
        posts.id AS posts_id
      FROM original_posts
        LEFT JOIN posts ON original_posts.id = posts.original_post_id
        LEFT JOIN attachments ON original_posts.id = attachments.holder_id
      WHERE posts.post_status_id = 'rejected';")
  end

  def down
    execute("DROP VIEW rejected_posts_v;") if self.table_exists?("rejected_posts_v")
    drop_table :rejected_posts_v if self.table_exists?("rejected_posts_v")
  end
end
