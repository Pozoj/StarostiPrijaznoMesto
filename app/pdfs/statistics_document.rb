# Encoding: utf-8
class StatisticsDocument < Prawn::Document
    def initialize(table,my_year,pdf_list_type)

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
        font_families.update("DejaVuSerif" => {
            :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
            :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
            :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
            :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
        })

        #current_date = l Time.now, :format => :short_date
        current_date = Time.now.strftime("%d. %-m. %Y")
        font "DejaVuSerif"
        table_data = [["Starosti prijazno mesto: VELENJE", "Seznam pobud za leto: #{my_year}", "Datum: #{current_date}"]]
        table(table_data,:cell_style => { :border_width => 0})

        move_down 10

        table_d = [["Št.", "Datum vprašanja","Ime in priimek izpraševalca", "Naziv objave", "Področje", "Datum odgovora", "Naslovljena ustanova"]] +
            table_d

        table table_d do
          row(0).font_style = :bold
          #columns(1..3).align = :right
          column(0).width = 36
          column(1).width = 75
          column(4).width = 100
          column(5).width = 75
          self.row_colors = ["FFFFFF", "DDDDDD"]
          self.header = true

        end
      end

      if pdf_list_type == 'full'
        super()
        #dolocim pisavo
        font_families.update("DejaVuSerif" => {
            :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
            :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
            :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
            :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
        })
        for row in table
          post = Post.find_by_id(row.posts_id)

          font "DejaVuSerif"
          text "#{post.title}", size: 30, style: :bold
          move_down 10
          text "Poslal #{post.original_post.first_name} #{post.original_post.last_name}"
          move_down 20
          text "Povzetek" , size: 20
          move_down 10
          text "<b>Vprašanje:</b> #{post.summary}", :inline_format => true
          if post.answered?
            move_down 5
            text "<b>Odgovor:</b> #{post.answer.summary}", :inline_format => true
          end
          move_down 20
          text "Podrobnosti" , size: 20
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
        date.strftime("%d. %-m. %y")
      else
        "X"
      end
    end

end