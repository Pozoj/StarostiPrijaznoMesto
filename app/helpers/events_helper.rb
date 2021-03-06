module EventsHelper
  include CalendarHelper
  
  def kalendar(events, date)
  	next_cal_date = date.next_month
  	prev_cal_date = date.prev_month
  	
    event_days = Event.on_month(date).collect { |event| event.day }.uniq
    
    cal = calendar( :year                 => date.year, 
                    :month                => date.month, 
                    :first_day_of_week    => 1,
                    :previous_month_text  => link_to( image_tag('left.png', :class => "left" ),   events_path(:month => prev_cal_date.month.to_s, :year => prev_cal_date.year.to_s) ),
                    :next_month_text      => link_to( image_tag('right.png', :class => "right" ), events_path(:month => next_cal_date.month.to_s, :year => next_cal_date.year.to_s) ),
                    :calendar_title       => I18n.l(date, :format => :month_year).titleize ) do |day|
      if event_days.include?(day.mday)
        
        evs = Event.on_day(day).collect do |event|
          link_title = event.title + " (" + l(event.date_and_time_at, :format => :time_only) + ")"
          content_tag(:li, link_to(link_title, event) )
        end.join.html_safe
        
        strong = content_tag(:strong, "Dogodki:")
        tooltip = content_tag(:span, strong + content_tag(:ol, evs), :class => "tooltip")
        [day.mday.to_s + tooltip, {:class => "special"}]
      else
        [day.mday, {:class => "normal"}]
      end
    end
    
    content_tag(:div, raw(cal), :id => "calendar")
  end
end