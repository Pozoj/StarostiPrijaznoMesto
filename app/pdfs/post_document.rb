# Encoding: utf-8
class PostDocument < Prawn::Document
  def initialize(post)
    super()

    #dolocim pisavo
    font_families.update("DejaVuSerif" => {
        :normal => "#{Rails.root}/app/assets/fonts/DejaVuSerif.ttf",
        :italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Italic.ttf",
        :bold => "#{Rails.root}/app/assets/fonts/DejaVuSerif-Bold.ttf",
        :bold_italic => "#{Rails.root}/app/assets/fonts/DejaVuSerif-BoldItalic.ttf"
    })

    font "DejaVuSerif"
    text "#{post.title}", size: 30, style: :bold
    move_down 10
    text "Poslal #{post.original_post.first_name} #{post.original_post.last_name}"
    move_down 20
    text "Povzetek" , size: 20
    move_down 10
    text "<b>Vprašanje:</b> #{post.summary}", :inline_format => true
    move_down 5
    text "<b>Odgovor:</b> #{post.answer.summary}", :inline_format => true
    move_down 20
    text "Podrobnosti" , size: 20
    move_down 5
    text "Objava", size: 10, style: :italic
    text "#{post.text}"
    move_down 5
    text "Odgovor", size: 10, style: :italic
    text "#{post.answer.answer}"
    move_down 15
    #temp = l post.original_post.created_at, :format => :short_date
    temp = post.original_post.created_at
    text "<b>Poslano:</b> #{temp}", :inline_format => true
    if post.attachment_added?
      require "open-uri"
      start_new_page(:layout => :landscape)
      image open("#{post.attachment.attachment.url}"),:position => :left, :width=>600
    end
  end
end