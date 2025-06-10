ActionView::Base.field_error_proc = Proc.new do |html_tag, _instance|
  # Return the html_tag without wrapping it with a div
  html_tag.html_safe
end
