# Encoding: utf-8
class StatisticsTablesController < ApplicationController
  skip_authorization_check     :only => :index

  helper_method :sort_column, :sort_direction

  def index
    #posljem podatke nazaj formi, da mi izbere, ze izbrane pogoje
    @statistics = Hash.new

    #mi pobere vse iz tabele, potem pa lahko delam selektivne filtre, glede na podane pogoje
    @table = StatisticsTable.where("1=1")
    #overall statistics
    @overall_table = StatisticsTable.where("1=1")
    if params[:tag_group_id].present?
      @table = @table.where(:posts_tag_group_id => params[:tag_group_id])
      @statistics[:tag_group_id] = params[:tag_group_id]
    end

    if params[:year].present?
      my_year = params[:year]
      correct_date_from = params[:year] + '-01-01'
      correct_date_to = params[:year] + '-12-31'
      @table = @table.where(:original_posts_created_at => correct_date_from..correct_date_to)
      @overall_table = @overall_table.where(:original_posts_created_at => correct_date_from..correct_date_to)
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

    if params[:pdf_list_type].present?
      @statistics[:pdf_list_type] = params[:pdf_list_type]
    end

    @table = @table.order(sort_column + " " + sort_direction)

    #za spustne menije
    @taggroups = TagGroup.all
    @postkinds = PostKind.all
    @institutions = Institution.all


    respond_to do |format|
      format.html
      format.pdf do
        pdf = StatisticsDocument.new(@table,@statistics, @overall_table)

        send_data pdf.render, filename: "Izbor_pobud.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end
  end

  private

  def sort_column
    (StatisticsTable.column_names).include?(params[:sort]) ? params[:sort] : "original_posts_created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def text_find(klass, value)
    if value.present?
      return klass.send(:find, value)
    else
      "✗"
    end
  end

end
