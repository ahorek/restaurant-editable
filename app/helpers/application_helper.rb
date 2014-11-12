module ApplicationHelper

  include LanguagesHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, { :class => css_class }
  end

  def galereya_headers_tags
    tags = []
    tags << stylesheet_link_tag('jquery.galereya.css')
    tags << javascript_include_tag('jquery.galereya.js')
    tags
  end

  def include_galereya_headers_tags
    unless @galereya_headers_tags_included
      @galereya_headers_tags_included = true
      content_for :head do
        galereya_headers_tags.join.html_safe
      end
    end
  end
end
