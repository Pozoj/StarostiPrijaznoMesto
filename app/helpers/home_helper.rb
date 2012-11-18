# Encoding: utf-8
module HomeHelper
  
  def what_happened(senders_sex, post_kind)
    what_gave = case post_kind
    when "comment" then "Komentiral"
    when "suggestion" then "Predlagal"
    when "question" then "Vprašal"
    end
    case senders_sex
    when "man" then what_gave
    when "woman" then what_gave + "a"
    when "unknown" then what_gave + "-a"
    end
  end
end
