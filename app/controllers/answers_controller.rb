class AnswersController < InheritedResources::Base
  load_and_authorize_resource
  
  def new
    @answer = Answer.new
    @answer.post = Post.find_by_id(params[:post_id]) if params[:post_id]
  end
  
  def update
    case post_kind_info
    when :question    then update!( :notice => "Uspešno ste odgovorili na vprašanje.") { addressed_questions_posts_path }
    when :comment     then update!( :notice => "Uspešno ste odgovorili na komentar.") { addressed_comments_posts_path }
    when :suggestion  then update!( :notice => "Uspešno ste odgovorili na predlog.") { addressed_suggestions_posts_path }
    end
  end
  
  def edit
    @answer = Answer.find_by_id(params[:id])
    @post_kind_title = (@answer.present? and @answer.post.present? and @answer.post.kind.present?) ? @answer.post.kind.title.downcase : ""
  end
  
  def create
    case post_kind_info
    when :question    then create!( :notice => "Uspešno ste naslovili vprašanje.") { unaddressed_questions_posts_path }
    when :comment     then create!( :notice => "Uspešno ste naslovili komentar.") { unaddressed_comments_posts_path } 
    when :suggestion  then create!( :notice => "Uspešno ste naslovili predlog.") { unaddressed_suggestions_posts_path }
    end
  end
  
  private
  
  def post_kind_info
    post = Post.find_by_id(params[:answer][:post_id]) if params[:answer][:post_id].present?
    post_kind_id = (post.present? and post.kind.present?) ? post.kind.id : ""
  end
  
end