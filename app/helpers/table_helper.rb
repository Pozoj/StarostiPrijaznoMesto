module TableHelper
  
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