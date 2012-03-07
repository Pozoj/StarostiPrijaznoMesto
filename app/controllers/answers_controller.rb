class AnswersController < InheritedResources::Base
  load_and_authorize_resource
  
  def new
    @answer = Answer.new
    @answer.post = Post.find_by_id(params[:post_id]) if params[:post_id]
  end
  
  def update
    update! do |success, failure|
      success.html { redirect_to addressed_posts_path, :notice => answered_notice }
      failure.html { render :action => :edit, :alert => "Za nadaljevanje odpravite napake." }
    end
  end
  
  def edit
    @answer = Answer.find_by_id(params[:id])
    @answer.user_id = current_user.id if current_user.present?
    @post_kind_title = (@answer.present? and @answer.post.present? and @answer.post.kind.present?) ? @answer.post.kind.title.downcase : ""
  end
  
  def create
    create!( :notice => addressed_notice ) { unaddressed_posts_path }
  end
  
  def destroy
    answer = Answer.find_by_id params[:id]
    destroy!(:notice => "Uspešno ste odstranili odgovor") { post_path(answer.post) }
  end
  
  private
  
  def post_kind_info
    post = Post.find_by_id(params[:answer][:post_id]) if params[:answer][:post_id].present?
    post_kind_id = (post.present? and post.kind.present?) ? post.kind.id : ""
  end
  
  def addressed_notice
    case post_kind_info
    when :question    then "Uspešno ste naslovili vprašanje."
    when :comment     then "Uspešno ste naslovili komentar."
    when :suggestion  then "Uspešno ste naslovili predlog."
    end
  end
  
  def answered_notice
    case post_kind_info
    when :question    then "Uspešno ste odgovorili na vprašanje."
    when :comment     then "Uspešno ste odgovorili na komentar."
    when :suggestion  then "Uspešno ste odgovorili na predlog."
    end
  end
  
end