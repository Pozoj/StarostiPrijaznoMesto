# Encoding: utf-8
module TableHelper
  def answering_institution(post)
    if post.institutions_name.present? and post.answers_answer_status.present?
      ending = post.post_kind_id == "question" ? "o" : ""
      case post.answers_answer_status 
      when "waiting" then "#{PostKind.find(post.post_kind_id)} čaka na izvršen odgovor od ustanove #{post.institutions_name}"
      when "answered" then "Na #{PostKind.find(post.post_kind_id).to_s.downcase} je odgovorila ustanova #{post.institutions_name}"
      when "institutionalized" then "#{PostKind.find(post.post_kind_id)} je bil#{ending} posredovan#{ending} ustanovi #{post.institutions_name}"
      end
    else
      case post.post_kind_id
      when "suggestion" then "Predlog še ni bil posredovan ustanovi"
      when "comment" then "Komentar še ni bil posredovan ustanovi"
      when "question" then "Vprašanje še ni bilo posredovano ustanovi"
      end
    end
  end
  
  def yes_no(thing)
    if thing.present?
      "✓"
    else
      "✗"
    end
  end
  
  def dateit(date)
    if date.present?
      l date, :format => :short_date
    else
      "✗"
    end
  end
  
  def text_find(klass, value)
    if value.present?
      return klass.send(:find, value)
    else
      "✗"
    end
  end
  
  def text_find_among_all(klass, value)
    if value.present?
      return klass.send(:find_among_all, value)
    else
      "✗"
    end
  end
  
  def textit(text)
    if text.present?
      text
    else
      "✗"
    end
  end
  
  def difference_in_days(prior_datetime, later_datetime)
    if later_datetime.present?
      return (later_datetime - prior_datetime).to_i / 1.day
    else
      return (Time.zone.now - prior_datetime).to_i / 1.day
    end
  end
end