class PostsController < InheritedResources::Base
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  
  def new
    @post = Post.new
    append_original_post
  end
  
  def create
    create! { original_posts_path }
  end
  
  def questions
    @posts = PublicPost.questions
    @no_posts_message = "Trenutno ni vprašanj."
    @title = "Vsa vprašanja"
    @post_kind_title = "Naziv vprašanja"
    render "posts/common/public"
  end
  
  def unaddressed_questions
    @title = "Nenaslovljena vprašanja"
    @no_posts_message = "Trenutno ni nenaslovljenih vprašanj."
    @posts = UnaddressedPost.questions.order(sort_column + " " + sort_direction)
    render "posts/common/unaddressed"
  end
  
  def unaddressed_comments
    @title = "Nenaslovljeni komentarji"
    @no_posts_message = "Trenutno ni nenaslovljenih komentarjev."
    @posts = UnaddressedPost.comments.order(sort_column + " " + sort_direction)
    render "posts/common/unaddressed"
  end
  
  def unaddressed_suggestions
    @title = "Nenaslovljeni predlogi"
    @no_posts_message = "Trenutno ni nenaslovljenih predlogov."
    @posts = UnaddressedPost.suggestions.order(sort_column + " " + sort_direction)
    render "posts/common/unaddressed"
  end

  def addressed_questions
    @title = "Naslovljena vprašanja"
    @no_posts_message = "Trenutno ni naslovljenih vprašanj."
    @posts = AddressedPost.institutionalized.questions.order(sort_column + " " + sort_direction)
    render "posts/common/addressed"
  end

  def addressed_comments
    @title = "Naslovljeni komentarji"
    @no_posts_message = "Trenutno ni naslovljenih komentarjev."
    @posts = AddressedPost.institutionalized.comments.order(sort_column + " " + sort_direction)
    render "posts/common/addressed"
  end

  def addressed_suggestions
    @title = "Naslovljeni predlogi"
    @no_posts_message = "Trenutno ni naslovljenih predlogov."
    @posts = AddressedPost.institutionalized.suggestions.order(sort_column + " " + sort_direction)
    render "posts/common/addressed"
  end
  
  def misplaced_questions
    @title = "Napačno naslovljena vprašanja"
    @no_posts_message = "Trenutno ni napačno naslovljenih vprašanj."
    @posts = AddressedPost.misplaced.questions.order(sort_column + " " + sort_direction)
    render "posts/common/addressed"
  end

  def misplaced_comments
    @title = "Napačno naslovljeni komentarji"
    @no_posts_message = "Trenutno ni napačno naslovljenih komentarjev."
    @posts = AddressedPost.misplaced.comments.order(sort_column + " " + sort_direction)
    render "posts/common/addressed"
  end

  def misplaced_suggestions
    @title = "Napačno naslovljeni predlogi"
    @no_posts_message = "Trenutno ni napačno naslovljenih predlogov."
    @posts = AddressedPost.misplaced.suggestions.order(sort_column + " " + sort_direction)
    render "posts/common/addressed"
  end
  
  def unapproved
  end
  
  protected
  
  def append_original_post
    @post.original_post = OriginalPost.find_by_id(params[:original_post_id]) if params[:original_post_id]
    if og = @post.original_post
      @post.text = og.text
      @post.info_admin_id = current_user.id
    end    
  end

  def sort_column
    (AddressedPost.column_names).include?(params[:sort]) ? params[:sort] : "original_posts_created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end  
end
