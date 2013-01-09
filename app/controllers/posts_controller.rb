# Encoding: utf-8
class PostsController < InheritedResources::Base
  load_and_authorize_resource
  skip_load_resource :only => [:questions, :comments, :suggestions]
  skip_before_filter :authenticate_user!, :only => [:questions, :comments, :suggestions]

  def new
    @post = Post.new
    append_original_post
  end
  
  def create
    create! { original_posts_path }
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html

      format.pdf do
        #pdf = Prawn::Document.new
        pdf = PostDocument.new

        #pdf.font "DejaVuSans"
        pdf.font_families.update("DejaVuSerif" => {
            :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
            :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
            :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
            :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
        })
        pdf.font "DejaVuSerif"
        pdf.text "#{@post.title}", size: 30, style: :bold
        pdf.move_down 10
        pdf.text "Poslal #{@post.original_post.first_name} #{@post.original_post.last_name}"
        pdf.move_down 20
        pdf.text "Povzetek" , size: 20
        pdf.move_down 10
        pdf.text "<b>Vprašanje:</b> #{@post.summary}", :inline_format => true
        pdf.move_down 5
        pdf.text "<b>Odgovor:</b> #{@post.answer.summary}", :inline_format => true
        pdf.move_down 20
        pdf.text "Podrobnosti" , size: 20
        pdf.move_down 5
        pdf.text "Objava", size: 10, style: :italic
        pdf.text "#{@post.text}"
        pdf.move_down 5
        pdf.text "Odgovor", size: 10, style: :italic
        pdf.text "#{@post.answer.answer}"
        pdf.move_down 15
        temp = l @post.original_post.created_at, :format => :short_date
        pdf.text "<b>Poslano:</b> #{temp}", :inline_format => true
        if resource.attachment_added?
          pdf.start_new_page
          pdf.image "#{@post.attachment.attachment.url}", :width => 500
        end
        send_data pdf.render, filename: "Vprasanje_#{@post.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end
  
  def questions
    @posts = PublicPost.questions.order(klass_sort_column(PublicPost) + " " + sort_direction)
    @no_posts_message = "Trenutno ni vprašanj."
    @title = "Vsa vprašanja"
    @post_kind_title = "Naziv vprašanja"
    @created_at_title = "Datum vprašanja"
    render "posts/common/public"
  end
  
  def comments
    @posts = PublicPost.comments.order(klass_sort_column(PublicPost) + " " + sort_direction)
    @no_posts_message = "Trenutno ni komentarjev."
    @title = "Vsi komentarji"
    @post_kind_title = "Naziv komentarja"
    @created_at_title = "Datum komentarja"
    render "posts/common/public"
  end
  
  def suggestions
    @posts = PublicPost.suggestions.order(klass_sort_column(PublicPost) + " " + sort_direction)
    @no_posts_message = "Trenutno ni predlogov."
    @title = "Vsi predlogi"
    @post_kind_title = "Naziv predloga"
    @created_at_title = "Datum predloga"
    render "posts/common/public"
  end
    
  def unaddressed
    @title = "Nenaslovljene pobude"
    @no_posts_message = "Trenutno ni nenaslovljenih pobud."
    if params[:posts_post_kind_id].present? and PostKind.keys.include?(params[:posts_post_kind_id])
      @posts = UnaddressedPost.where(:posts_post_kind_id => params[:posts_post_kind_id]).order(klass_sort_column(UnaddressedPost) + " " + sort_direction)
    else
      @posts = UnaddressedPost.order(klass_sort_column(UnaddressedPost) + " " + sort_direction)
    end
    render "posts/common/unaddressed"
  end
  
  def addressed
    @title = "Naslovljene pobude"
    @no_posts_message = "Trenutno ni naslovljenih pobud."
    post_scope_and_order_for(Institutionalized)
    render "posts/common/addressed"
  end
  
  def misplaced
    @title = "Napačno naslovljene pobude"
    @no_posts_message = "Trenutno ni napačno naslovljenih pobud."
    post_scope_and_order_for(Misplaced)
    render "posts/common/addressed"
  end
  
  def answered
    @title = "Odgovorjene pobude"
    @no_posts_message = "Trenutno ni odgovorjenih pobud."
    post_scope_and_order_for(Answered)
    render "posts/common/addressed"
  end
  
  def waiting
    @title = "Pobude v čakanju"
    @no_posts_message = "Trenutno ni pobud v čakanju."
    post_scope_and_order_for(Waiting)
    render "posts/common/addressed"
  end
  
  def unapproved
    @title = "Zavrnjene objave"
    @posts = RejectedPost.order(klass_sort_column(RejectedPost) + " " + sort_direction)
  end
  
  protected
  
  def post_scope_and_order_for(klass)
    @posts = klass.scoped
    post_kind_scope
    institution_scope
    @posts = @posts.order(klass_sort_column(klass) + " " + sort_direction)
  end
  
  def post_kind_scope
    if params[:posts_post_kind_id].present? and PostKind.keys.include?(params[:posts_post_kind_id])
      @posts = @posts.where(:posts_post_kind_id => params[:posts_post_kind_id])
    end
  end
  
  def institution_scope
    if current_user.user_kind.present? and current_user.institution_id.present? and current_user.user_kind.institution_admin?
      @posts = @posts.for_institution(current_user.institution_id)
    end
  end
  
  def append_original_post
    @post.original_post = OriginalPost.find_by_id(params[:original_post_id]) if params[:original_post_id]
    if og = @post.original_post
      @post.text = og.text
      @post.info_admin_id = current_user.id
    end    
  end

end
