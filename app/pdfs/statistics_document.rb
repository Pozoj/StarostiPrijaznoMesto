# Encoding: utf-8
class StatisticsDocument < Prawn::Document
  def initialize(table, statistics, overall_table)

    pdf_list_type = statistics[:pdf_list_type]
    search_filter = get_filter(statistics)
    #search_filter = ""

    font_families.update("DejaVuSerif" => {
        :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
        :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
        :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
        :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
    })

    if pdf_list_type == 'list'
      st = 0
      table_d = [[]]
      for row in table
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

      super(:page_size => "A4", :page_layout => :landscape)
      font "DejaVuSerif"

      repeat :all do
        # header
        bounding_box [bounds.left, bounds.top], :width => bounds.width do
          current_date = Time.now.strftime("%-d. %-m. %Y")
          table_data = [["STAROSTI PRIJAZNO MESTO VELENJE", "Datum izpisa: #{current_date}"]]
          table table_data do
            row(0..1).font_style = :bold
            columns(1..1).align = :right
            row(0).columns(0..1).borders = []
            row(0).width = 382
          end
          move_down(5)
          table_data = [["Filter iskanja: #{search_filter}"]]
          table table_data do
            row(0).columns(0..0).borders = []
            row(0).columns(0..0).style(:size => 9)
            row(0).width = 764
          end
          stroke_horizontal_rule
        end

        # footer
        #bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        #  #font "Helvetica"
        #  stroke_horizontal_rule
        #  move_down(5)
        #  text "#{@p_count} in a total of <total>", :size => 9
        #end
      end

      bounding_box([bounds.left, bounds.top - 55], :width => bounds.width, :height => bounds.height - 100) do

        #move_down 40

        table_d = [["Št.", "Datum vprašanja", "Ime in priimek izpraševalca", "Naziv objave", "Področje", "Datum odgovora", "Naslovljena ustanova"]] +
            table_d

        table table_d do
          row(0).font_style = :bold
          #columns(1..3).align = :right
          column(0).width = 36
          column(1).width = 75
          column(4).width = 100
          column(5).width = 75
          columns(0..6).style(:border_width => 0, :size => 9)
          columns(0..6).height = 18
          row(0).height = 35
          self.row_colors = ["FFFFFF", "DDDDDD"]
          self.header = true

        end
      end

      #NOW PRINT THE PAGE NUMBER
      page_count.times do |i|
        go_to_page(i+1)
        bounding_box [bounds.left, bounds.bottom + 25], :width => bounds.width do
          stroke_horizontal_rule
          move_down(5)
          text "Stran #{(i+1)} od #{page_count}", :size => 9
        end
      end
    end
    if pdf_list_type == 'full'
      super(:page_size => "A4", :page_layout => :portrait)
      #dolocim pisavo
      font "DejaVuSerif"
      st = 0
      current_date = Time.now.strftime("%-d. %-m. %Y")

      repeat :all do
          bounding_box [bounds.left, bounds.top], :width => bounds.width do
            table_data = [["STAROSTI PRIJAZNO MESTO VELENJE", "Datum izpisa: #{current_date}"]]
            table table_data do
              row(0..1).font_style = :bold
              columns(1..1).align = :right
              #row(0).style(:border_width => 0)
              row(0).columns(0..1).borders = [:bottom]
              row(0).columns(0..1).style(:size => 11)
              row(0).width = 261
              #self.border_width = 0
            end
          end
          move_down 30
        end
        bounding_box([bounds.left, bounds.top - 55], :width => bounds.width, :height => bounds.height - 100) do

          for row in table
            st = st +1
            start_new_page(:page_size => "A4", :page_layout => :portrait) unless st == 1

            post = Post.find_by_sql(["SELECT * FROM posts WHERE original_post_id = ?", row.original_posts_id]).first()



          unless post.present?
            text "ERROR: #{row.original_posts_id}"
          else
            font "DejaVuSerif"
            text "#{post.title}", size: 14, style: :bold
            move_down 15

            post_created_at = ""
            post_answered_at = ""
            post_forwarded_at = ""

            post_created_at = post.original_post.created_at.strftime("%d. %-m. %y") unless post.created_at == ""
            post_answered_at = post.answered_at.strftime("%d. %-m. %y") unless post.answered_at == ""
            post_forwarded_at = post.forwarded_at.strftime("%d. %-m. %y") unless post.forwarded_at == ""

            post_forwarded = ""
            post_answered = ""
            answer_summary = ""
            answer_answer = ""
            post_forwarded = "#{post_forwarded_at}, #{post.responsible_institution}" unless post.forwarded_at == ""
            post_answered = "#{post_answered_at}, #{post.answered_by}" unless post.answered_at == ""
            answer_summary = "#{post.answer.summary}" if post.answered?
            answer_answer = "#{post.answer.answer}" if post.answered?

            table_data = [["Pobudo podal/a:", "#{post_created_at}, #{post.sender}"],
                          ["Področje:", "#{post.tag_group}"],
                          ["Pobuda posredovana:", "#{post_forwarded}"],
                          ["Odgovor posredovala:", "#{post_answered}"],
                          ["Povzetek vprašanja:", "#{post.summary}"],
                          ["Vprašanje:", "#{post.text}"],
                          ["Povzetek odgovora:", "#{answer_summary}"],
                          ["Odgovor:", "#{answer_answer}"]]
            table table_data do
              columns(0).font_style = :bold
              columns(0).width = 145
              columns(1).width = 378
              row(0..7).columns(0..1).borders = []
              row(0..7).columns(0..1).style(:size => 10)
            end

            if post.attachment_added?
              require "open-uri"

              for attachment in post.attachments
                if attachment.is_image?
                  start_new_page(:page_size => "A4", :page_layout => :portrait)

                  table_data = [["STAROSTI PRIJAZNO MESTO VELENJE", "Datum izpisa: #{current_date}"]]
                  table table_data do
                    row(0..1).font_style = :bold
                    columns(1..1).align = :right
                    #row(0).style(:border_width => 0)
                    row(0).columns(0..1).borders = [:bottom]
                    row(0).columns(0..1).style(:size => 11)
                    row(0).width = 261
                    #self.border_width = 0
                  end
                  move_down 15
                  image open("#{attachment.attachment.url}"), :position => :left, :width => 370
                end
                if attachment.is_pdf?
                  filename = "#{attachment.url}"
                  start_new_page(:template => filename)
                end
              end
            end
          end
        end
      end
      #NOW PRINT THE PAGE NUMBER
      page_count.times do |i|
        go_to_page(i+1)
        bounding_box [bounds.left, bounds.bottom + 25], :width => bounds.width do
          stroke_horizontal_rule
          move_down(5)
          text "Stran #{(i+1)} od #{page_count}", :size => 9
        end
      end
    end
    if pdf_list_type == 'overall'
      st = 0
      table_d = [[]]
      for row in table
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

      super(:page_size => "A4", :page_layout => :portrait)
      font "DejaVuSerif"

      if statistics[:year].present?
        filter = "Leto: #{statistics[:year]}"
      else
        filter = "Leto: Vsa leta"
      end

      repeat :all do
        # header
        bounding_box [bounds.left, bounds.top], :width => bounds.width do
          current_date = Time.now.strftime("%-d. %-m. %Y")
          table_data = [["STAROSTI PRIJAZNO MESTO VELENJE", "Datum izpisa: #{current_date}"]]
          table table_data do
            row(0..1).font_style = :bold
            columns(1..1).align = :right
            row(0).columns(0..1).borders = []
            row(0).width = 261
          end
          move_down(5)
          table_data = [["Filter iskanja: #{filter}"]]
          table table_data do
            row(0).columns(0..0).borders = []
            row(0).columns(0..0).style(:size => 12)
            row(0).width = 523
            row(0).style(:size => 9)
          end
          stroke_horizontal_rule
        end
      end

      bounding_box([bounds.left, bounds.top - 65], :width => bounds.width, :height => bounds.height - 100) do

        move_down 10

        all_count = overall_table.count

        text "V tem obdobju je bilo podanih #{all_count} pobud in sicer:", style: :bold

        #post_kind_id
        table_data = []
        PostKind.all.each do |kind|
          count = overall_table.where(:posts_post_kind_id => kind.id).count
          table_data<<["#{kind.title}", "#{count}"]
        end

        table table_data do
          #columns(0).font_style = :bold
          columns(0).width = 85
          columns(1).width = 378
          row(0..2).columns(0..1).borders = []
          row(0..2).columns(0..1).style(:size => 10)
          row(0..2).height = 19
        end

        move_down 40

        text "Pobude, ki so bile podane v tem obdobju po posameznih področjih:", style: :bold

        #tag_group_id
        table_data = []
        TagGroup.all.each do |tag|
          count = overall_table.where(:posts_tag_group_id => tag.id).count
          table_data<<["#{tag.title}", "#{count}"]
        end

        table table_data do
          #columns(0).font_style = :bold
          columns(0).width = 235
          columns(1).width = 178
          row(0..20).columns(0..1).borders = []
          row(0..20).columns(0..1).style(:size => 10)
          row(0..20).height = 19
        end

        move_down 40

        table_data = [["Pobude podane po spolu so naslednje:", "Moški", "Ženske", "ni bil podan"]]
        TagGroup.all.each do |tag|
          temp_table = overall_table.where(:posts_tag_group_id => tag.id)
          count_m = temp_table.where(:posts_sex_id => "man").count
          count_w = temp_table.where(:posts_sex_id => "woman").count
          count_u = temp_table.where(:posts_sex_id => "unknown").count

          table_data<<["#{tag.title}", "#{count_m}", "#{count_w}", "#{count_u}"]
        end
        table table_data do
          #columns(0).font_style = :bold
          row(0).font_style = :bold
          columns(0).width = 240
          columns(1).width = 50
          columns(2).width = 50
          columns(3).width = 110
          row(0..20).columns(0..3).borders = []
          row(0..20).columns(0..3).style(:size => 10)
          row(0..20).height = 19
        end

      end

      #NOW PRINT THE PAGE NUMBER
      page_count.times do |i|
        go_to_page(i+1)
        bounding_box [bounds.left, bounds.bottom + 25], :width => bounds.width do
          stroke_horizontal_rule
          move_down(5)
          text "Stran #{(i+1)} od #{page_count}", :size => 9
        end
      end
    end

=begin
    super()
    #dolocim pisavo
    font_families.update("DejaVuSerif" => {
        :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
        :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
        :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
        :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
    })
    for row in table
      #o_post = OriginalPost.find_by_id(row.original_posts_id)

      post = Post.find_by_sql(["SELECT * FROM posts WHERE original_post_id = ?", row.original_posts_id]).first()

      font "DejaVuSerif"
      text "#{post.title}", size: 30, style: :bold
      move_down 10
      text "Poslal #{post.original_post.first_name} #{post.original_post.last_name}"
      move_down 20

      text "Povzetek", size: 20
      move_down 10
      text "<b>Vprašanje:</b> #{post.summary}", :inline_format => true
      if post.answered?
        move_down 5
        text "<b>Odgovor:</b> #{post.answer.summary}", :inline_format => true
      end
      move_down 20
      text "Podrobnosti", size: 20
      move_down 5
      text "Objava", size: 10, style: :italic
      text "#{post.text}"
      if post.answered?
        move_down 5
        text "Odgovor", size: 10, style: :italic
        text "#{post.answer.answer}"
      end
      move_down 15
      #temp = l post.original_post.created_at, :format => :short_date
      temp = post.original_post.created_at.strftime("%d. %-m. %y")
      #date.strftime("%d. %-m. %y")
      text "<b>Poslano:</b> #{temp}", :inline_format => true

      if post.attachment_added?
        require "open-uri"
        start_new_page(:layout => :landscape)
        #image open("#{post.attachment.attachment.url}"),:position => :left, :width=>500
      end

      start_new_page(:layout => :portrait)
    end
  end
=end


  end

  def text_find(klass, value)
    if value.present?
      return klass.send(:find, value)
    else
      "X"
    end
  end

  def dateit(date)
    if date.present?
      #l date, :format => :short_date
      date.strftime("%-d. %-m. %y")
    else
      "X"
    end
  end

  def get_filter(statistics)
    search = ""
    if statistics[:tag_group_id].present?
      search = "Področje:  #{TagGroup.find(statistics[:tag_group_id])}"
    else
      search = "Področje: Vsa področja"
    end


    if statistics[:year].present?
      search = "#{search} / Leto: #{statistics[:year]}"
    else
      search = "#{search} / Leto: Vsa leta"
    end

    if statistics[:post_kind_id].present?
      search = "#{search} / Pobude: #{PostKind.find(statistics[:post_kind_id]).to_s}"
    else
      search = "#{search} / Pobude: Vse pobude"
    end

    if statistics[:institution_id].present?
      search = "#{search} / Institucija: #{Institution.find(statistics[:institution_id]).to_s}"
    else
      search = "#{search} / Institucija: Vse institucije"
    end

    search
  end

end