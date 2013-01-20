# Encoding: utf-8
class StatisticsDocument < Prawn::Document
    def initialize(table,my_year)

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
      table_data = [["Starosti prijazno mesto: VELENJE", "Seznam pobud za leto: #{my_year}", "Datum: #{current_date}", "Stran: 1"]]
      table(table_data,:cell_style => { :border_width => 0})

      move_down 10

      table_d = [["Št.", "Datum vprašanja","Ime in priimek izpraševalca", "Naziv objave", "Področje", "Datum odgovora", "Naslovljena ustanova"]] +
          table_d

      table table_d do
        row(0).font_style = :bold
        columns(1..3).align = :right
        column(0).width = 30
        column(1).width = 75
        column(4).width = 100
        self.row_colors = ["FFFFFF", "DDDDDD"]
        self.header = true

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