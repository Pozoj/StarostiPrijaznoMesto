class PostsController < InheritedResources::Base
  load_and_authorize_resource
  skip_load_resource :only => [:questions, :comments, :suggestions]
  skip_before_filter :authenticate_user!, :only => [:questions, :comments, :suggestions]
  
  helper_method :klass_sort_column, :sort_direction
  
  def new
    @post = Post.new
    append_original_post
  end
  
  def create
    create! { original_posts_path }
  end
  
  def questions
    @posts = PublicPost.questions.order(klass_sort_column(PublicPost) + " " + sort_direction)
    @no_posts_message = "Trenutno ni vprašanj."
    @title = "Vsa vprašanja"
    @post_kind_title = "Naziv vprašanja"
    render "posts/common/public"
  end
  
  def comments
    @posts = PublicPost.comments.order(klass_sort_column(PublicPost) + " " + sort_direction)
    @no_posts_message = "Trenutno ni komentarjev."
    @title = "Vsi komentarji"
    @post_kind_title = "Naziv komentarja"
    render "posts/common/public"
  end
  
  def suggestions
    @posts = PublicPost.suggestions.order(klass_sort_column(PublicPost) + " " + sort_direction)
    @no_posts_message = "Trenutno ni predlogov."
    @title = "Vsi predlogi"
    @post_kind_title = "Naziv predloga"
    render "posts/common/public"
  end
  
  #unaddressed
  def unaddressed_questions
    @title = "Nenaslovljena vprašanja"
    @no_posts_message = "Trenutno ni nenaslovljenih vprašanj."
    @posts = UnaddressedPost.questions.order(klass_sort_column(UnaddressedPost) + " " + sort_direction)
    render "posts/common/unaddressed"
  end
  
  def unaddressed_comments
    @title = "Nenaslovljeni komentarji"
    @no_posts_message = "Trenutno ni nenaslovljenih komentarjev."
    @posts = UnaddressedPost.comments.order(klass_sort_column(UnaddressedPost) + " " + sort_direction)
    render "posts/common/unaddressed"
  end
  
  def unaddressed_suggestions
    @title = "Nenaslovljeni predlogi"
    @no_posts_message = "Trenutno ni nenaslovljenih predlogov."
    @posts = UnaddressedPost.suggestions.order(klass_sort_column(UnaddressedPost) + " " + sort_direction)
    render "posts/common/unaddressed"
  end

  #addressed
  def addressed_questions
    @title = "Naslovljena vprašanja"
    @no_posts_message = "Trenutno ni naslovljenih vprašanj."
    @posts = AddressedPost.institutionalized.questions.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end

  def addressed_comments
    @title = "Naslovljeni komentarji"
    @no_posts_message = "Trenutno ni naslovljenih komentarjev."
    @posts = AddressedPost.institutionalized.comments.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end

  def addressed_suggestions
    @title = "Naslovljeni predlogi"
    @no_posts_message = "Trenutno ni naslovljenih predlogov."
    @posts = AddressedPost.institutionalized.suggestions.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end
  
  #misplaced
  def misplaced_questions
    @title = "Napačno naslovljena vprašanja"
    @no_posts_message = "Trenutno ni napačno naslovljenih vprašanj."
    @posts = AddressedPost.misplaced.questions.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end

  def misplaced_comments
    @title = "Napačno naslovljeni komentarji"
    @no_posts_message = "Trenutno ni napačno naslovljenih komentarjev."
    @posts = AddressedPost.misplaced.comments.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end

  def misplaced_suggestions
    @title = "Napačno naslovljeni predlogi"
    @no_posts_message = "Trenutno ni napačno naslovljenih predlogov."
    @posts = AddressedPost.misplaced.suggestions.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end
  
  #waiting
  def waiting_questions
    @title = "Vprašanja v čakanju"
    @no_posts_message = "Trenutno ni vprašanj v čakanju."
    @posts = AddressedPost.waiting.questions.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end

  def waiting_comments
    @title = "Komentarji v čakanju"
    @no_posts_message = "Trenutno ni komentarjev v čakanju."
    @posts = AddressedPost.waiting.comments.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end

  def waiting_suggestions
    @title = "Predlogi v čakanju"
    @no_posts_message = "Trenutno ni predlogov v čakanju."
    @posts = AddressedPost.waiting.suggestions.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end
  
  #answered
  def answered_questions
    @title = "Odgovorjena vprašanja"
    @no_posts_message = "Trenutno ni odgovorjenih vprašanj."
    @posts = AddressedPost.answered.questions.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end

  def answered_comments
    @title = "Odgovorjeni komentarji"
    @no_posts_message = "Trenutno ni odgovorjenih komentarjev."
    @posts = AddressedPost.answered.comments.order(klass_sort_column(AddressedPost) + " " + sort_direction)
    render "posts/common/addressed"
  end

  def answered_suggestions
    @title = "Odgovorjeni predlogi"
    @no_posts_message = "Trenutno ni odgovorjenih predlogov."
    @posts = AddressedPost.answered.suggestions.order(klass_sort_column(AddressedPost) + " " + sort_direction)
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

  def klass_sort_column(klass)
    (klass.column_names).include?(params[:sort]) ? params[:sort] : "original_posts_created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end  
end
