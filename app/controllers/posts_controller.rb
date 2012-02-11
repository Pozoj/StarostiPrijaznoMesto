class PostsController < InheritedResources::Base
  load_and_authorize_resource
  
  def new
    @post = Post.new
    append_original_post
  end
  
  def create
    create! { original_posts_path }
  end
  
  def unaddressed_questions
    @title = "Nenaslovljena vprašanja"
    @no_questions_message = "Trenutno ni nenaslovljenih vprašanj."
    @questions = Post.unaddressed_questions.group_by {|question| question.created_at.to_date }
  end

  def addressed_questions
    @title = "Naslovljena vprašanja"
    @no_questions_message = "Trenutno ni naslovljenih vprašanj."
    @questions = Post.addressed_questions.group_by {|question| question.answers.last.created_at.to_date }
  end

  def answered_questions
    @title = "Odgovorjena vprašanja"
    @no_questions_message = "Trenutno ni odgovorjenih vprašanj."
    @questions = Post.answered_questions
  end
  
  def suggestions
    @suggestions = Post.approved.suggestions.group_by {|comment| comment.created_at.to_date }
  end
  
  def comments
    @comments = Post.approved.comments.group_by {|comment| comment.created_at.to_date }
  end
  
  def unapproved
    @unapproved = Post.rejected
  end
    
  protected
  
  def append_original_post
    @post.original_post = OriginalPost.find_by_id(params[:original_post_id]) if params[:original_post_id]
    if og = @post.original_post
      @post.text = og.text
      @post.info_admin_id = current_user.id
    end    
  end


  # def all
  #   @order = params[:order] || "number"
  #   sort_proc = case @order
  #     when "author" then lambda {|r| [r.user.name.downcase, r.number] } 
  #     when "status", "title" then lambda {|r| [r.send(@order).downcase, r.number]} 
  #     when "number" then lambda {|r| -r.number }
  #   end
  #   @rcrs = Rcr.find(:all).sort_by &sort_proc 
  # end
end
