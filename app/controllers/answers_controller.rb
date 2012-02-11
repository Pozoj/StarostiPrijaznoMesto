class AnswersController < InheritedResources::Base
  load_and_authorize_resource
  
  def institutionalize
    @answer = Answer.new
    @answer.post = Post.find_by_id(params[:post_id]) if params[:post_id]
    @answer.answer_status = "institutionalized"
  end
  
  def create
    create!( :notice => "Uspešno ste naslovili vprašanje") { unaddressed_questions_posts_path }
  end
end