module ApplicationHelper
  
  def full_title page_title = ""
    base_title = t "static_pages.rails_tutorial"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
