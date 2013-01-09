# Encoding: utf-8
class StatisticsTablesController < ApplicationController
  load_and_authorize_resource :only => :index

  helper_method :sort_column, :sort_direction

  def index
    #posljem podatke nazaj formi, da mi izbere, ze izbrane pogoje
    @statistics = Hash.new

    #mi pobere vse iz tabele, potem pa lahko delam selektivne filtre, glede na podane pogoje
    @table = SuperAdminTable.where("1=1")
    if params[:tag_group_id].present?
      @table = @table.where(:posts_tag_group_id => params[:tag_group_id])
      @statistics[:tag_group_id] = params[:tag_group_id]
    end

    if params[:year].present?
      my_year = params[:year]
      correct_date_from = params[:year] + '-01-01'
      correct_date_to = params[:year] + '-12-31'
      @table = @table.where(:original_posts_created_at => correct_date_from..correct_date_to)
      @statistics[:year] = params[:year]
    else
      my_year = "Vsa leta"
    end

    if params[:post_kind_id].present? and PostKind.keys.include?(params[:post_kind_id])
      @table = @table.where(:posts_post_kind_id => params[:post_kind_id])
      @statistics[:post_kind_id] = params[:post_kind_id]
      my_post_kind = PostKind.find(params[:post_kind_id]).to_s
    else
      my_post_kind = "Vse pobude"
    end


    if params[:institution_id].present?
      @table = @table.where(:institutions_id => params[:institution_id])
      @statistics[:institution_id] = params[:institution_id]
    end

    @table = @table.order(sort_column + " " + sort_direction)

    st = 0
    table_d = [[]]
    for row in @table
      my_answer = dateit row.answers_answered_at
      my_create = dateit row.original_posts_created_at
      table_d = table_d + [
          [(st+=1).to_s+".",
           "#{my_create}",
           row.original_posts_first_name + ' ' + row.original_posts_last_name,
           row.posts_title,
           text_find(TagGroup, row.posts_tag_group_id).to_s,
           "#{my_answer}",
           row.institutions_name]
      ]
    end

    #za spustne menije
    @taggroups = TagGroup.all
    @postkinds = PostKind.all
    @institutions = Institution.all


    respond_to do |format|
      format.html
      format.pdf do

        #prikaz enakega seznama, kot je na strani
        pdf = Prawn::Document.new(:page_size => "A4", :page_layout => :landscape)
        #pdf = PostDocument.new

        #pdf.font "DejaVuSans"
        pdf.font_families.update("DejaVuSerif" => {
            :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
            :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
            :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
            :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
        })

        current_date = l Time.now, :format => :short_date
        pdf.font "DejaVuSerif"
        table_data = [["Starosti prijazno mesto: VELENJE", "Seznam pobud za leto: #{my_year}", "Datum: #{current_date}", "Stran: 1"]]
        pdf.table(table_data,:cell_style => { :border_width => 0})

        pdf.move_down 10

        table_d = [["Št.", "Datum vprašanja","Ime in priimek izpraševalca", "Naziv objave", "Področje", "Datum odgovora", "Naslovljena ustanova"]] +
            table_d

        pdf.table table_d do
          row(0).font_style = :bold
          columns(1..3).align = :right
          self.row_colors = ["FFFFFF", "DDDDDD"]
          self.header = true

        end






        #pdf.font "DejaVuSerif"
        #pdf.text "#{@post.title}", size: 30, style: :bold
        #pdf.move_down 10
        #pdf.text "Poslal #{@post.original_post.first_name} #{@post.original_post.last_name}"
        #pdf.move_down 20
        #pdf.text "Povzetek" , size: 20
        #pdf.move_down 10
        #pdf.text "<b>Vprašanje:</b> #{@post.summary}", :inline_format => true
        #pdf.move_down 5
        #pdf.text "<b>Odgovor:</b> #{@post.answer.summary}", :inline_format => true
        #pdf.move_down 20
        #pdf.text "Podrobnosti" , size: 20
        #pdf.move_down 5
        #pdf.text "Objava", size: 10, style: :italic
        #pdf.text "#{@post.text}"
        #pdf.move_down 5
        #pdf.text "Odgovor", size: 10, style: :italic
        #pdf.text "#{@post.answer.answer}"
        #pdf.move_down 15
        #temp = l @post.original_post.created_at, :format => :short_date
        #pdf.text "<b>Poslano:</b> #{temp}", :inline_format => true
        send_data pdf.render, filename: "Izbor_pobud.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end
  end

  private

  def sort_column
    (SuperAdminTable.column_names).include?(params[:sort]) ? params[:sort] : "original_posts_created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def dateit(date)
    if date.present?
      l date, :format => :short_date
    else
      "X"
    end
  end

  def text_find(klass, value)
    if value.present?
      return klass.send(:find, value)
    else
      "✗"
    end
  end

end
