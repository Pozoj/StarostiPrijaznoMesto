module ApplicationHelper
  
  def association_link_list(resource, associations)
    list_items = resource.send(associations).collect do |associated_item|
      content_tag(:li, link_to(associated_item, associated_item)) 
    end.join.html_safe
    content_tag(:ul, list_items, :class => "#{associations}-list")
  end
  
  def array_to_link_list(array_of_objects, title = "")
    list_items = array_of_objects.collect do |obj|
      content_tag(:li, link_to(obj, obj)) 
    end.join.html_safe
    content_tag(:ul, list_items, :class => "#{title}-list")
  end
  
  def array_to_unordered_list(array_of_objects)
    list_items = array_of_objects.collect do |obj|
      content_tag(:li, obj.to_s) 
    end.join.html_safe
    content_tag(:ul, list_items)
  end
  
  def collection_list_renderer(collection)
    if Array(collection).any?
      content_tag(:div, content_tag(:ul, render(collection)), :class => "collection-list")
    else
      tag("div", :class => "collection-list")
    end
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction }, {:class => css_class}
  end
  
end