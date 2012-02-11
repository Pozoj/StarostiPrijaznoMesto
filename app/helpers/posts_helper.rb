module PostsHelper
  
  def list_of_post_links(array_of_posts, title = "post")
    list_items = array_of_posts.collect do |post|
      [content_tag(:li, link_to(post, post)), content_tag(:span, post.summary, :class => "summary") ].join
    end.join.html_safe
    content_tag(:ul, list_items, :class => "#{title}-list")
  end
  
end
