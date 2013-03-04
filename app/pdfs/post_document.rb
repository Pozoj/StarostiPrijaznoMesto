# Encoding: utf-8
class PostDocument < Prawn::Document
  def initialize(post)
    super(:page_size => "A4",:page_layout => :portrait)
    #dolocim pisavo
    font_families.update("DejaVuSerif" => {
        :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
        :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
        :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
        :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
    })
    font "DejaVuSerif"

      #post = Post.find_by_sql(["SELECT * FROM posts WHERE original_post_id = ?", row.original_posts_id]).first()


      current_date = Time.now.strftime("%-d. %-m. %Y")

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
      move_down 30

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
          #unless Rails.application.assets.find_asset("#{post.attachment.attachment.url}").nil?
          if post.attachment.is_image?
            require "open-uri"
            start_new_page(:layout => :landscape)
            image open("#{post.attachment.attachment.url}"),:position => :left, :width=>300
          end
          if post.attachment.is_pdf?
            require "open-uri"
            #filename = "#{Rails.root}/app/assets/images/tt.pdf"
            filename = "#{post.attachment.attachment.url}"
            start_new_page(:template => filename)
          end
          #end
        end
      end
    end


  #  #filename = "#{Rails.root}/app/assets/images/tt.pdf"
  #  #super(:template => filename)
  #  super()
  #  #dolocim pisavo
  #  font_families.update("DejaVuSerif" => {
  #      :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
  #      :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
  #      :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
  #      :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
  #  })
  #
  #  current_date = Time.now.strftime("%d. %-m. %Y")
  #  font "DejaVuSerif"
  #  table_data = [["STAROSTI PRIJAZNO MESTO VELENJE", "Datum izpisa: #{current_date}"]]
  #  table table_data do
  #    row(0..1).font_style = :bold
  #    columns(1..1).align = :right
  #    #row(0).style(:border_width => 0)
  #    row(0).columns(0..1).borders = [:bottom]
  #    row(0).columns(0..1).style(:size => 11)
  #    row(0).width = 268
  #    #self.border_width = 0
  #  end
  #  move_down 30
  #
  #  font "DejaVuSerif"
  #  text "#{post.title}", size: 14, style: :bold
  #  move_down 15
  #
  #  post_created_at =  ""
  #  post_answered_at = ""
  #  post_forwarded_at = ""
  #
  #  post_created_at = post.original_post.created_at.strftime("%d. %-m. %y") unless post.created_at == ""
  #  post_answered_at = post.answered_at.strftime("%d. %-m. %y") unless post.answered_at == ""
  #  post_forwarded_at = post.forwarded_at.strftime("%d. %-m. %y") unless post.forwarded_at == ""
  #
  #  post_forwarded = ""
  #  post_answered = ""
  #  answer_summary = ""
  #  answer_answer = ""
  #  post_forwarded = "#{post_forwarded_at}, #{post.responsible_institution}" unless post.forwarded_at == ""
  #  post_answered = "#{post_answered_at}, #{post.answered_by}" unless post.answered_at == ""
  #  answer_summary =  "#{post.answer.summary}" if post.answered?
  #  answer_answer  = "#{post.answer.answer}" if post.answered?
  #
  #  table_data = [["Pobudo podal/a:", "#{post_created_at}, #{post.sender}"],
  #                ["Področje:", "#{post.tag_group}"],
  #                ["Pobuda posredovana:", "#{post_forwarded}"],
  #                ["Odgovor posredovala:", "#{post_answered}"],
  #                ["Povzetek vprašanja:", "#{post.summary}"],
  #                ["Vprašanje:", "#{post.text}"],
  #                ["Povzetek odgovora:", "#{answer_summary}"],
  #                ["Odgovor:", "#{answer_answer}"]]
  #  table table_data do
  #    #row(0..1).font_style = :bold
  #    columns(0).font_style = :bold
  #    columns(0).width =  158
  #    columns(1).width =  378
  #    #row(0).style(:border_width => 0)
  #    row(0..7).columns(0..1).borders = []
  #    row(0..7).columns(0..1).style(:size => 10)
  #    #row(0..7).height = 30
  #    #self.border_width = 0
  #  end
  #
  #  if post.attachment_added?
  #    require "open-uri"
  #    start_new_page(:layout => :landscape)
  #    image open("#{post.attachment.attachment.url}"),:position => :left, :width=>500
  #  end
  #end
end